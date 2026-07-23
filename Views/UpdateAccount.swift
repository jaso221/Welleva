//
//  UpdateAccount.swift
//  Welleva
//
//  Created by Sichen Wang on 23/7/2026.
//
import SwiftUI

struct UpdateView: View {

    @Binding var currentPage: Int
    @Binding var username: String
    @Binding var email: String
    @Binding var password: String

    @State private var editingUsername = ""
    @State private var editingEmail = ""
    @State private var editingPassword = ""

    @State private var isEditingUsername = false
    @State private var isEditingEmail = false
    @State private var isEditingPassword = false
    
    @EnvironmentObject var theme: AppTheme

    var body: some View {
        VStack(spacing: 25) {
            
            TopBar(currentPage: $currentPage, title: "Settings")
            
            ScrollView {
                VStack(spacing: 20){
                    Text("Member details")
                        .multilineTextAlignment(.leading)
                    
                    section(
                        title: "Member Name",
                        value: username,
                        isEditing: $isEditingUsername,
                        editingText: $editingUsername
                    ) {
                        username = editingUsername
                    }
                }
                .padding()
                .background(.gray.opacity(0.05))
                .font(.headline)
                .foregroundStyle(Color(.black))
                
                Spacer()
                
                VStack(spacing: 20){
                    Text("Content details")
                        .multilineTextAlignment(.leading)
                    
                    section(
                        title: "Email Address",
                        value: email,
                        isEditing: $isEditingEmail,
                        editingText: $editingEmail
                    ) {
                        email = editingEmail
                    }
                }
                .padding()
                .background(.gray.opacity(0.05))
                .font(.headline)
                .foregroundStyle(Color(.black))
                
                Spacer()
                
                VStack(spacing: 20){
                    Text("Password")
                        .multilineTextAlignment(.leading)
                    
                    section(
                        title: "Change password",
                        value: password.isEmpty ? "Not Set" : "********",
                        isEditing: $isEditingPassword,
                        editingText: $editingPassword,
                        isSecure: true
                    ) {
                        password = editingPassword
                    }
                }
                .padding()
                .background(.gray.opacity(0.05))
                .font(.headline)
                .foregroundStyle(Color(.black))
                
                Spacer()
                
                Button(role: .destructive) {
                    deleteAccount()
                } label: {
                    Text("Delete Account")
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding(.bottom)
            }
            .padding()
        }
    }
    @ViewBuilder
    func section(
        title: String,
        value: String,
        isEditing: Binding<Bool>,
        editingText: Binding<String>,
        isSecure: Bool = false,
        onSave: @escaping () -> Void
    ) -> some View {

        VStack(alignment: .leading, spacing: 8) {

            Text(title)
                .font(.caption)
                .foregroundColor(.gray)

            if isEditing.wrappedValue {
                HStack {
                    if isSecure {
                        SecureField("Enter", text: editingText)
                    } else {
                        TextField("Enter", text: editingText)
                    }

                    Button("Save") {
                        onSave()
                        isEditing.wrappedValue = false
                    }

                    Button("Cancel") {
                        isEditing.wrappedValue = false
                    }
                    .foregroundColor(.red)
                }
            } else {
                HStack {
                    Text(value)
                        .font(.title3)

                    Spacer()

                    Button {
                        editingText.wrappedValue = value
                        isEditing.wrappedValue = true
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    func deleteAccount() {
        username = ""
        email = ""
        password = ""

        currentPage = 19
    }
}
