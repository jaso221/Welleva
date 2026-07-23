//
//
//  Homepage.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//
import SwiftUI
import Combine

struct HomePage: View {
    
    @Binding var currentPage: Int
    @Binding var userName: String
    
    @EnvironmentObject var theme: AppTheme
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            //top
            HStack {
                
                Button {
                    currentPage = 9
                } label: {
                    Image("Setting")
                }
                
                Spacer()
                
                Text("Home")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 16) {
                    
                    Button {
                        currentPage = 12
                    } label: {
                        Image("Translate")
                    }
                    
                    Button {
                        currentPage = 13
                    } label: {
                        Image("Size")
                    }
                    
                    Button {
                        currentPage = 14
                    } label: {
                        Image("Colour")
                    }
                }
            }
            .padding()
            .background(theme.barBackground)
            
            
            // middle
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        
                        Image("User")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Good morning,")
                                .font(.system(size: theme.fontSize))
                                .foregroundColor(.black)
                            
                            Text(userName.isEmpty ? "User" : userName)
                                .font(.system(size: theme.fontSize))
                                .bold()
                                .foregroundColor(theme.primary)
                        }
                    }
      
                    HStack {
                        Image("WelcomeQuestion")
                            .frame(width: 30,height: 30)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Your Device is Protected")
                                .bold()
                            
                            Text("Everything looks safe today")
                                .foregroundColor(theme.primary)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                    
                    Button {
                        currentPage = 10
                    } label: {
                        
                        VStack(spacing: 12) {
                            Image("ScanAMessage")
                            
                            Text("Scan a Message")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            
                            Text("Check for scams or fraud")
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(theme.primary)
                        .cornerRadius(24)
                    }
                 
                    HStack(spacing: 16) {
                        
                        Button {
                            currentPage = 15
                        } label: {
                            SmallCard(
                                title: "Check Fake Info",
                                image: "CheckNews"
                            )
                        }
                        
                        Button {
                            currentPage = 16
                        } label: {
                            SmallCard(
                                title: "Report Scam",
                                image: "ReportScam"
                            )
                        }
                    }
                
                    // Tip
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack {
                            Image("Light")
                            Text("Tip of the day")
                                .bold()
                        }
                        
                        Text("Never share your bank passwords or verification codes with anyone over the phone, even if they claim to be from the bank.")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                    
                }
                .padding()
            }
            
            // button
            TabBar(currentPage: $currentPage)
            
        }
    }
}
