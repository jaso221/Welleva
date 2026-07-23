//
//  CheckInputView.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import SwiftUI
import PhotosUI
import UIKit

struct CheckInputView: View {
    @Binding var currentPage: Int
    @EnvironmentObject var theme: AppTheme

    @State private var pastedInput: String = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var extractedText: String = ""
    @State private var isProcessing: Bool = false

    @State private var verdict: String = ""
    @State private var explanation: String = ""
    @State private var showResult: Bool = false

    private let geminiService = GeminiService()

    var verdictColor: Color {
        switch verdict {
        case "True": return .green
        case "False": return .red
        case "Misleading": return .orange
        default: return .gray
        }
    }

    var verdictIcon: String {
        switch verdict {
        case "True": return "checkmark.circle.fill"
        case "False": return "xmark.circle.fill"
        case "Misleading": return "exclamationmark.triangle.fill"
        default: return "questionmark.circle.fill"
        }
    }

    var body: some View {
        VStack(spacing: 0) {

            // Themed top bar — matches homepage/other screens
            TopBar(currentPage: $currentPage, title: "Check Fake Info")
                .background(theme.barBackground)

            ScrollView {
                VStack(spacing: 20) {

                    Text("Paste a message, headline, or claim to check if it's true or false.")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Screenshot preview
                    if let selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 180)
                            .cornerRadius(16)
                            .padding(.horizontal)
                    }

                    // Paste from clipboard button
                    HStack {
                        Spacer()
                        Button {
                            pastedInput = UIPasteboard.general.string ?? pastedInput
                        } label: {
                            Label("Paste from Clipboard", systemImage: "doc.on.clipboard")
                                .font(.subheadline.bold())
                                .foregroundStyle(theme.primary)
                        }
                        Spacer()
                    }

                    // Text input
                    TextEditor(text: $pastedInput)
                        .frame(height: 130)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(14)
                        .padding(.horizontal)

                    // Action buttons
                    HStack(spacing: 12) {
                        PhotosPicker(selection: $selectedItem, matching: .images) {
                            Label("Screenshot", systemImage: "photo.on.rectangle")
                                .font(.subheadline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(.systemGray5))
                                .foregroundStyle(.primary)
                                .cornerRadius(12)
                        }

                        Button {
                            runCheck()
                        } label: {
                            if isProcessing {
                                ProgressView().tint(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(12)
                            } else {
                                Text("Check Now")
                                    .font(.subheadline)
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(pastedInput.isEmpty && extractedText.isEmpty ? Color.gray : theme.primary)
                                    .foregroundStyle(.white)
                                    .cornerRadius(12)
                            }
                        }
                        .disabled(isProcessing || (pastedInput.isEmpty && extractedText.isEmpty))
                    }
                    .padding(.horizontal)

                    // Processing indicator
                    if isProcessing && !showResult {
                        ProgressView()
                            .padding(.top, 8)
                    }

                    // Result card
                    if showResult {
                        VStack(spacing: 16) {
                            Image(systemName: verdictIcon)
                                .font(.system(size: 50))
                                .foregroundStyle(verdictColor)

                            Text(verdict)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(verdictColor)

                            Text(explanation)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.primary)
                                .padding(.horizontal)
                        }
                        .padding(24)
                        .frame(maxWidth: .infinity)
                        .background(verdictColor.opacity(0.08))
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 40)
                }
            }

            TabBar(currentPage: $currentPage)
        }
        .onChange(of: selectedItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    isProcessing = true
                    ScreenshotOCR.extractText(from: uiImage) { text in
                        DispatchQueue.main.async {
                            extractedText = text
                            pastedInput = text
                            isProcessing = false
                        }
                    }
                }
            }
        }
    }

    private func runCheck() {
        isProcessing = true
        showResult = false
        let textToCheck = pastedInput.isEmpty ? extractedText : pastedInput
        Task {
            let result = await geminiService.checkFakeInfo(textToCheck)
            await MainActor.run {
                verdict = result.verdict
                explanation = result.explanation
                isProcessing = false
                showResult = true
            }
        }
    }
}

#Preview {
    CheckInputView(currentPage: .constant(15))
        .environmentObject(AppTheme())
}
