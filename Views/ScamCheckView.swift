//
//  ScamCheckView.swift
//  Welleva
//
//  Created by Ojas Satarkar on 21/7/2026.
//

import SwiftUI
import PhotosUI

struct ScamCheckView: View {
    @Binding var currentPage: Int

    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var extractedText: String = ""
    @State private var isProcessing: Bool = false

    @State private var verdict: String = ""
    @State private var explanation: String = ""

    @State private var pastedInput: String = ""
    @State private var showPasteInput: Bool = false

    private enum ActiveSheet: Identifiable {
        case result
        var id: Int { hashValue }
    }
    @State private var activeSheet: ActiveSheet?

    var body: some View {
        VStack(spacing: 20) {

            HStack {
                Button {
                    currentPage = 8
                } label: {
                    Image("IntroBack")
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)

            Text("Check a Message")
                .font(.title)
                .bold()

            // Screenshot preview
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
                    .cornerRadius(16)
                    .padding(.horizontal)
            } else if !showPasteInput {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 1.5)
                    .frame(height: 140)
                    .overlay(
                        Text("No screenshot selected")
                            .foregroundStyle(.gray)
                    )
                    .padding(.horizontal)
            }

            // Paste text / link input
            if showPasteInput {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Paste your message or link")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .padding(.horizontal)

                    TextEditor(text: $pastedInput)
                        .frame(height: 140)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)

                    Button {
                        extractedText = pastedInput
                        analyzeText()
                    } label: {
                        Text("Analyze for Scam")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(pastedInput.isEmpty ? Color.gray : Color.redPink)
                            .foregroundStyle(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .disabled(pastedInput.isEmpty || isProcessing)
                }
            }

            // Action buttons
            HStack(spacing: 16) {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Label("Screenshot", systemImage: "photo.on.rectangle")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.redPink)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }

                Button {
                    showPasteInput.toggle()
                    if showPasteInput {
                        selectedImage = nil
                        extractedText = ""
                    }
                } label: {
                    Label(showPasteInput ? "Cancel" : "Paste Text", systemImage: showPasteInput ? "xmark" : "doc.on.clipboard")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(showPasteInput ? Color.gray.opacity(0.3) : Color.black)
                        .foregroundStyle(showPasteInput ? Color.primary : Color.white)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)

            if isProcessing {
                ProgressView("Analyzing...")
                    .padding()
            }

            // OCR extracted text + analyze button
            if !extractedText.isEmpty && !showPasteInput {
                ScrollView {
                    Text(extractedText)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .padding()
                }
                .frame(maxHeight: 120)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)

                Button {
                    analyzeText()
                } label: {
                    Text("Analyze for Scam")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.redPink)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .disabled(isProcessing)
            }

            Spacer()
        }
        .onChange(of: selectedItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    showPasteInput = false
                    pastedInput = ""
                    isProcessing = true
                    ScreenshotOCR.extractText(from: uiImage) { text in
                        DispatchQueue.main.async {
                            extractedText = text
                            isProcessing = false
                        }
                    }
                }
            }
        }
        .sheet(item: $activeSheet) { sheet in
            switch sheet {
            case .result:
                ScamResultView(
                    currentPage: $currentPage,
                    verdict: verdict,
                    explanation: explanation,
                    originalText: extractedText
                )
            }
        }
    }

    private func analyzeText() {
        isProcessing = true
        Task {
            let service = GeminiService()
            let result = await service.checkContent(extractedText)
            // Persist to Firestore so DeviceView scan history shows it
            let scan = ScanResult(
                content: String(extractedText.prefix(200)),
                verdict: result.verdict,
                explanation: result.explanation,
                type: "message"
            )
            FirestoreService().saveScanResult(scan)
            await MainActor.run {
                verdict = result.verdict
                explanation = result.explanation
                isProcessing = false
                activeSheet = .result
            }
        }
    }
}

#Preview {
    ScamCheckView(currentPage: .constant(10))
}
