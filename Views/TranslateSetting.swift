//
//  TranslateSetting.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import SwiftUI

struct TranslateSetting: View {

    @Binding var currentPage: Int
    @EnvironmentObject var theme: AppTheme

    // Local draft — applied to theme only on Save
    @State private var draft: String = "English"

    var body: some View {
        VStack(spacing: 0) {
            TopBar(currentPage: $currentPage, title: "Adjust Language")

            VStack(spacing: 20) {
                Text(theme.t("Adjust Language"))
                    .font(.headline)

                Text(theme.t("Make reading easier for you"))
                    .foregroundColor(.gray)

                // Live preview sentence in the selected draft language
                Text(AppTranslations.translate("Hello, how can I help you?", language: draft))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red)
                    )

                // Current selection row
                HStack {
                    Text(theme.t("Language"))
                    Spacer()
                    Text(draft)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

                // Options — display in their native name
                VStack(spacing: 12) {
                    LanguageRow(title: "English",  selectedLanguage: $draft)
                    LanguageRow(title: "Español",  selectedLanguage: $draft)
                    LanguageRow(title: "Français", selectedLanguage: $draft)
                }

                // Save — update theme (re-renders all views) and persist to UserDefaults
                Button {
                    let mapped: String
                    switch draft {
                    case "Español":  mapped = "Spanish"
                    case "Français": mapped = "French"
                    default:         mapped = "English"
                    }
                    theme.selectedLanguage = mapped
                    UserDefaults.standard.set(mapped, forKey: "selectedLanguage")
                    currentPage = 8
                } label: {
                    Text(theme.t("Save Changes"))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("redPink"))
                        .cornerRadius(10)
                }

                Button(theme.t("Cancel")) {
                    currentPage = 8
                }
                .foregroundColor(.gray)
            }
            .padding()

            Spacer()

            TabBar(currentPage: $currentPage)
        }
        .onAppear {
            // Mirror persisted value back to display name
            switch theme.selectedLanguage {
            case "Spanish": draft = "Español"
            case "French":  draft = "Français"
            default:        draft = "English"
            }
        }
    }
}
