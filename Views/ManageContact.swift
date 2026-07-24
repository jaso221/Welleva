
//
//  ManageContact.swift
//  Veritas
//
//  Created by Sichen Wang on 23/7/2026.
//
import SwiftUI

struct ManageContact: View {
    @Binding var currentPage: Int
    @Binding var user: UserProfile
    
    @State private var editingcontactName = ""
    @State private var isEditingcontactName = false
    
    @State private var editingcontactNumber = ""
    @State private var isEditingcontactNumber = false
    
    @EnvironmentObject var theme: AppTheme
    
    var body: some View {
        VStack(spacing: 20){
            
            TopBar(currentPage: $currentPage, title: "Settings")
            
            ScrollView {
                
                VStack(alignment:.leading, spacing: 20){
                    Text("Get trusted help quickly")
                        .font(.headline)
                        .padding()
                    
                    VStack(alignment:.leading, spacing: 10){
                        
                        infoRow(text: "Add trusted family members or friends as your emergency contacts.")
                        infoRow(text: "If you're unsure about a message, call or need support, you can reach your chosen contacts in just a few taps.")
                        infoRow(text: "You decide who your emergency contacts are, and you can update or remove them at any time.")
                    }
                    .background(Color.white)
                    .padding()
                }
                .background(Color.pinn)
                .padding()
                
                VStack(spacing:10){
                    
                    Text("Emergency Contact")
                    
                    section(
                        title: "Contact Name",
                        value: user.contactName,
                        isEditing: $isEditingcontactName,
                        editingText: $editingcontactName
                    ) {
                        user.contactName = editingcontactName
                        save()
                    }
                    
                    section(
                        title: "Contact Number",
                        value: user.contactNumber,
                        isEditing: $isEditingcontactNumber,
                        editingText: $editingcontactNumber
                    ) {
                        user.contactNumber = editingcontactNumber
                        save()
                    }
                    
                }
                .padding()
                .background(.pinn)
                .font(.headline)
            }
        }
        .onAppear {
            load()
        }
    }
    
    func save() {
        ContactStorage.saveContact(
            for: user.id,
            name: user.contactName,
            number: user.contactNumber
        )
    }
    
    func load() {
        let data = ContactStorage.loadContact(for: user.id)
        user.contactName = data.name
        user.contactNumber = data.number
    }
}

@ViewBuilder
func infoRow(text: String) -> some View {
    HStack{
        Image(systemName: "checkmark")
            .resizable()
            .frame(width: 20, height: 20)
            .padding(.top, 4)
        
        Text(text)
            .font(.subheadline)
            .multilineTextAlignment(.leading)
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
                Text(value.isEmpty ? "Not set" : value)
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
    .background(Color.white)
    .cornerRadius(12)
}
