
//
//  UpdateAccount.swift
//  Welleva
//
//  Created by Sichen Wang on 23/7/2026.
//
import SwiftUI

struct UpdateAccount: View {

    @Binding var currentPage: Int
    @Binding var user: UserProfile

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
                        value: user.name,
                        isEditing: $isEditingUsername,
                        editingText: $editingUsername
                    ) {
                        user.name = editingUsername
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
                        value: user.email,
                        isEditing: $isEditingEmail,
                        editingText: $editingEmail
                    ) {
                        user.email = editingEmail
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
                        value: user.password.isEmpty ? "Not Set" : "********",
                        isEditing: $isEditingPassword,
                        editingText: $editingPassword,
                        isSecure: true
                    ) {
                        user.password = editingPassword
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
        user.name = ""
        user.email = ""
        user.password = ""

        currentPage = 19
    }
}
