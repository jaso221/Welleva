//
//  Biometrics.swift
//  Veritas
//
//  Created by Sichen Wang on 23/7/2026.
//
import SwiftUI

struct Biometrics: View {
    @Binding var currentPage: Int
    @EnvironmentObject var theme: AppTheme
    
    var body: some View{
        VStack(spacing: 10){
            TopBar(currentPage: $currentPage, title: "Settings")
            
            ScrollView {
                VStack(spacing: 20){
                    Text("Fewer passwords to manage")
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 20){
                        HStack{
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                            
                            Text("Sign in with your fingerprint or face instead of remembering another password.")
                                .font(.headline)
                                .foregroundStyle(Color.black)
                                .multilineTextAlignment(.leading)
                        }
                        
                        HStack{
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                            
                            Text("Open the app quickly when you need to check for a potential scam.")
                                .font(.headline)
                                .foregroundStyle(Color.black)
                                .multilineTextAlignment(.leading)
                        }
                        
                        HStack{
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                            
                            Text("Biometrics help protect your account while making sign-in more convenient.")
                                .font(.headline)
                                .foregroundStyle(Color.black)
                                .multilineTextAlignment(.leading)
                        }
                        
                    }
                    .background(Color.white)
                    .padding()
                }
                .background(Color.pinn)
                .padding()
                
                Button{
                    currentPage = 9
                }label: {
                    VStack{
                        Text("Set Up Biometrics")
                            .font(.headline)
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        Text("You are leaving the app")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(theme.primary)
                .cornerRadius(24)
            }
            .padding()
        }
    }
}
