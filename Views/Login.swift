
//
//  Login.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
import SwiftUI

struct Login: View {
    @Binding var currentPage: Int
    @Binding var user: UserProfile

    @EnvironmentObject var authService: AuthService

    @State private var inputEmail: String = ""
    @State private var inputPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Button {
                    currentPage = 3
                } label: {
                    Image("IntroBack")
                        .font(.title2)
                        .padding()
                }
                .padding(.bottom)
                
                Text("Welcome Back to")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
                Text("Veritas")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.redPink)
                
                Text("Securely log in to your account and keep your digital world protected.")
                    .foregroundStyle(Color.gray)
                    .padding(.bottom)
                
                Text("Email Address")
                    .font(.subheadline)
                    .bold()
                
                TextField("john@example.com", text: $inputEmail)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                
                HStack {
                    Text("Password")
                        .font(.subheadline)
                        .bold()
                    
                    Spacer()
                    
                    Button("Forgot password?") {}
                        .foregroundStyle(Color.redPink)
                        .font(.caption)
                }
                .padding(.top)
                
                HStack {
                    if showPassword {
                        TextField("Enter password", text: $inputPassword)
                    } else {
                        SecureField("Enter password", text: $inputPassword)
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
                
                if let errorMessage {
                    Text(errorMessage)
                        .font(.caption)
                        .foregroundStyle(Color.red)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.top, 4)
                }
                
                Spacer()
                
                VStack(spacing: 12) {
                    Text("TRUST INDICATORS")
                        .font(.caption)
                        .foregroundStyle(Color.gray)
                    
                    HStack(spacing: 40) {
                        VStack {
                            Image("WelcomeGlobal")
                                .foregroundStyle(Color.pink)
                            Text("SSL SECURED")
                                .font(.caption)
                                .foregroundStyle(Color.gray)
                        }
                        
                        VStack {
                            Image("WelcomePrivacy")
                                .foregroundStyle(Color.pink)
                            Text("NO LOGS POLICY")
                                .font(.caption)
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                Button {
                    isLoading = true
                    errorMessage = nil
                    
                    Task {
                        let error = await authService.signIn(email: inputEmail, password: inputPassword)
                        await MainActor.run {
                            isLoading = false
                            if let error {
                                errorMessage = error
                            } else {
                                user.email = inputEmail
                                user.password = inputPassword
                                
                                currentPage = 8
                            }
                        }
                    }
                } label: {
                    ZStack {
                        Text("LOG IN")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.white)
                            .opacity(isLoading ? 0 : 1)
                        if isLoading {
                            ProgressView().tint(.white)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 2/3)
                    .padding()
                    .background(Color.redPink)
                    .cornerRadius(20)
                }
                .disabled(isLoading || inputEmail.isEmpty || inputPassword.isEmpty)
                .frame(maxWidth: .infinity)
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(Color.gray)
                    
                    Button("Sign up") {
                        currentPage = 6
                    }
                    .foregroundStyle(Color.redPink)
                }
                .frame(maxWidth: .infinity)
                .padding(.top)
            }
            .padding()
        }
    }
}

//#Preview {
//    Login(currentPage: .constant(7), userName: .constant(""))
//        .environmentObject(AuthService())
//}
