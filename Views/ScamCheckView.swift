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

    // A view can only reliably present one `.sheet(isPresented:)`. Driving both the
    // camera and the result from a single enum-based sheet avoids them conflicting.
    private enum ActiveSheet: Identifiable {
        case camera
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
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundStyle(.primary)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)

            Text("Check a Screenshot")
                .font(.title)
                .bold()
            
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
                    .cornerRadius(16)
                    .padding()
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 1.5)
                    .frame(height: 200)
                    .overlay(
                        Text("No screenshot selected")
                            .foregroundStyle(.gray)
                    )
                    .padding()
            }
            
            HStack(spacing: 16) {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Label("Choose Screenshot", systemImage: "photo.on.rectangle")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.redPink)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }
                
                Button {
                    activeSheet = .camera
                } label: {
                    Label("Take Photo", systemImage: "camera")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
            
            if isProcessing {
                ProgressView("Analyzing...")
                    .padding()
            }
            
            if !extractedText.isEmpty {
                ScrollView {
                    Text(extractedText)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .padding()
                }
                .frame(maxHeight: 150)
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
            case .camera:
                CameraPicker(image: $selectedImage) { uiImage in
                    isProcessing = true
                    ScreenshotOCR.extractText(from: uiImage) { text in
                        DispatchQueue.main.async {
                            extractedText = text
                            isProcessing = false
                        }
                    }
                }
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
            await MainActor.run {
                verdict = result.verdict
                explanation = result.explanation
                isProcessing = false
                activeSheet = .result
            }
        }
    }
}

struct CameraPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    var onCapture: (UIImage) -> Void
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraPicker
        init(_ parent: CameraPicker) { self.parent = parent }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
                parent.onCapture(uiImage)
            }
            picker.dismiss(animated: true)
        }
    }
}

#Preview {
    ScamCheckView(currentPage: .constant(10))
}
