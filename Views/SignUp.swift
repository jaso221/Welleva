//
//  SignUp.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
 import SwiftUI

struct SignUp: View {
    @Binding var currentPage: Int
    @State private var FUllName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Button{
                currentPage = 3
            }label: {
                Image("IntroBack")
                    .font(.title2)
                    .padding()
            }
            .padding(.bottom)
            
            HStack{
                Text("Join")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
                Text("SafeGuard")
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
            
            TextField("John Doe", text: $FUllName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            Text("Email Address")
                .font(.subheadline)
                .bold()
            
            TextField("john@example.com", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            Text("Password")
                .font(.subheadline)
                .bold()
            
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
            
            Text("By signing up, you agree to our Terms of Service and Privacy Policy.")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .padding(8)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button{
               // currentPage =
            } label: {
                Text("CREATE ACCOUNT")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width * 2/3)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(20)
                    
            }
            .frame(maxWidth: .infinity)
            
            HStack{
                Text("Already have an account?")
                    .foregroundStyle(.black)
                
                Button("Log in"){
                    currentPage = 6
                }
                .foregroundStyle(Color.pink)
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
            
        }
        .padding()
        
        HStack{
            Image("WelcomeGlobal")
            
            Button("Encrypted"){
                currentPage = 4
            }
            .font(.callout)
            .foregroundStyle(Color.gray)
            
            Image("WelcomePrivacy")
            
            Button("Privacy First"){
                currentPage = 5
            }
            .font(.callout)
            .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    SignUp(currentPage: .constant(7))
}
