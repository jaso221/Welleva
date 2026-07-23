//
//  SignUp.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
import SwiftUI

struct SignUp: View {
    @Binding var currentPage: Int
    @Binding var userName: String

    @EnvironmentObject var authService: AuthService

    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?

    var body: some View {

        VStack(alignment: .leading) {

            Button {
                currentPage = 3
            } label: {
                Image("IntroBack")
                    .font(.title2)
                    .padding()
            }
            .padding(.bottom)

            HStack {
                Text("Join")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)

                Text("Veritas")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.pink)
            }

            Text("protect your digital life today with the world's most trusted security companion.")
                .foregroundStyle(Color.gray)
                .padding(.bottom)

            Text("Full Name")
                .font(.subheadline)
                .bold()

            TextField("John Doe", text: $fullName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)

            Text("Email Address")
                .font(.subheadline)
                .bold()

            TextField("john@example.com", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)

            Text("Password")
                .font(.subheadline)
                .bold()

            HStack {
                if showPassword {
                    TextField("Enter password", text: $password)
                } else {
                    SecureField("Enter password", text: $password)
                }

                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye" : "eye.slash")
                        .foregroundStyle(Color.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(20)

            Text("By signing up, you agree to our Terms of Service and Privacy Policy.")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .padding(8)
                .multilineTextAlignment(.center)

            if let errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundStyle(Color.red)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            Button {
                isLoading = true
                errorMessage = nil
                userName = fullName
                Task {
                    let error = await authService.signUp(email: email, password: password)
                    await MainActor.run {
                        isLoading = false
                        if let error {
                            errorMessage = error
                        } else {
                            currentPage = 8
                        }
                    }
                }
            } label: {
                ZStack {
                    Text("CREATE ACCOUNT")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .opacity(isLoading ? 0 : 1)
                    if isLoading {
                        ProgressView().tint(.white)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 2/3)
                .padding()
                .background(Color.pink)
                .cornerRadius(20)
            }
            .disabled(isLoading || email.isEmpty || password.isEmpty)
            .frame(maxWidth: .infinity)

            HStack {
                Text("Already have an account?")
                    .foregroundStyle(.black)

                Button("Log in") {
                    currentPage = 7
                }
                .foregroundStyle(Color.pink)
            }
            .frame(maxWidth: .infinity)
            .padding(.top)

            HStack(spacing: 5) {
                Image("WelcomeGlobal")
                    .padding()
                Button("Encrypted") {
                    currentPage = 4
                }
                .font(.callout)
                .foregroundStyle(Color.gray)
                .padding()
                .frame(maxWidth: .infinity)

                Image("WelcomePrivacy")
                    .padding()
                Button("Privacy First") {
                    currentPage = 5
                }
                .font(.callout)
                .foregroundStyle(Color.gray)
                .padding()
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    SignUp(
        currentPage: .constant(6),
        userName: .constant("")
    )
    .environmentObject(AuthService())
}
