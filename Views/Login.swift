//
//  Login.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
import SwiftUI

struct Login: View {
    @Binding var currentPage: Int
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Button{
                currentPage = 3
            }label: {
                Image("IntroBack")
                    .font(.title2)
                    .padding()
            }
            .padding(.bottom)
            
            Text("Welcome Back to")
                .font(.title)
                .bold()
                .foregroundColor(.black)
            
            Text("SafeGuard")
                .font(.title)
                .bold()
                .foregroundStyle(Color.pink)
            
            Text("Securely log in to your account and keep your digital world protected.")
                .foregroundStyle(Color.gray)
                .padding(.bottom)
            
            Text("Email Address")
                .font(.subheadline)
                .bold()
            
            TextField("john@example.com", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            HStack{
                Text("Password")
                    .font(.subheadline)
                    .bold()
                
                Spacer()
                
                Button("Forgot password?") {
                    // currentPage =
                }
                .foregroundStyle(Color.red)
                .font(.caption)
            }
            .padding(.top)
            
            HStack{
                if showPassword {
                    TextField("Enter password", text: $password)
                } else {
                    SecureField("Enter password", text: $password)
                }
                
                Button{
                    showPassword.toggle()
                }label: {
                    Image(systemName: showPassword ? "eye" : "eye.slash")
                        .foregroundStyle(Color.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(20)
            
            Spacer()
            
            VStack(spacing: 12){
                Text ("TRUST INDICATORS")
                    .font(.caption)
                    .foregroundStyle(Color.gray)
                
                HStack(spacing: 40){
                    
                    VStack{
                        Image("WelcomeGlobal")
                            .foregroundStyle(Color.pink)
                        Text("SSL SECURED")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                    }
                    
                    VStack{
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
            
            Button{
                 currentPage = 8
            } label: {
                Text("LOG IN")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color.white)
                    .frame(width: UIScreen.main.bounds.width * 2/3)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(20)
            }
            .frame(maxWidth: .infinity)
            
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(Color.gray)
                
                Button("Sign up"){
                    currentPage = 7
                }
                .foregroundStyle(Color.pink)
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    Login(currentPage: .constant(6))
}

