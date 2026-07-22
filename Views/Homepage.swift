//
//  Homepage.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//
import SwiftUI

struct HomePage: View {
    @Binding var currentPage: Int
    var userName: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                
                Button {
                    currentPage = 9
                } label: {
                    Image("Setting")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .background(Color.white.opacity(0.1))
                        .clipShape(Circle())
                }
                
                Text("Home")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Spacer()
                
                HStack(spacing: 12) {
                    
                    Button {
                        currentPage = 12
                    } label: {
                        Image("Translate")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                    
                    Button {
                        currentPage = 13
                    } label: {
                        Image("Size")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                    
                    Button {
                        currentPage = 14
                    } label: {
                        Image("Colour")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
            }
            .padding()
            .background(Color.black)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    HStack {
                        Image("User")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Good morning,")
                                .font(.title3)
                            
                            Text(userName)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.redPink)
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image("WelcomeQuestion")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Your Device is Protected")
                                .bold()
                            
                            Text("Everything looks safe today")
                                .foregroundColor(.redPink)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.pinn, lineWidth: 1)
                    )
                    
                    Button {
                        currentPage = 10
                    } label: {
                        VStack(spacing: 12) {
                            Image("ScanAMessage")
                                .resizable()
                                .frame(width: 40, height: 40)
                            
                            Text("Scan a Message")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            
                            Text("Check for scams or fraud")
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.redPink)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                    }
                    
                    HStack(spacing: 15) {
                        
                        Button {
                            currentPage = 15
                        } label: {
                            SmallCard(title: "Check News", icon: "CheckNews")
                                .foregroundStyle(Color.black)
                                .bold()
                        }
                        
                        Button {
                            currentPage = 16
                        } label: {
                            SmallCard(title: "Report Scam", icon: "ReportScam")
                                .foregroundColor(.black)
                                .bold()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("💡 Tip of the day")
                            .bold()
                        
                        Text("Never share your bank passwords or verification codes with anyone over the phone, even if they claim to be from the bank.")
                            .foregroundColor(.black)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding()
            }
            
            HStack {
                
                TabItem(title: "Home", page: 8, icon:"Home", currentPage: $currentPage)
                TabItem(title: "Device Status", page: 17, icon:"Device", currentPage: $currentPage)
                TabItem(title: "Learning", page: 11, icon:"Learning", currentPage: $currentPage)
                TabItem(title: "Discover", page: 18, icon:"Discover", currentPage: $currentPage)
            }
            .padding()
            .background(Color.black)
        }
    }
}

#Preview {
    HomePage(currentPage: .constant(0), userName: "Wei")
}
