//
//  Homepage.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//

import SwiftUI

struct Homepage: View {
    @Binding var currentPage: Int
    @Binding var userName: String
    
    @State private var fullName: String = ""
    
    var body: some View{
        
        VStack(spacing: 0){
            
            HStack{
                Button{
                    //    currentPage =
                }label: {
                    Image("Setting")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                }
                .padding()
                
                Text("Home")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .bold()
                    .padding()
                
                HStack{
                    Button{
                        // currentPage =
                    }label: {
                        Image("Translate")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                    
                    Button{
                        // currentPage =
                    }label: {
                        Image("Size")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                    
                    Button{
                        // currentPage =
                    }label: {
                        Image("Colour")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .padding(.top, 8)
            .background(.black)
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(edges: .top)
         
            ScrollView{
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Image("User")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60,height: 60)
                            .clipShape(Circle())
                            .padding()
                        
                        VStack(alignment: .leading){
                            Text("Good morning")
                                .font(.title)
                                .bold()
                            
                            Text(userName.isEmpty ? "User" : userName)
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color.redPink)
                            
                        }
                    }
                    
                    HStack{
                        Image("WelcomeQuestion")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding()
                            .clipShape(Circle())
                           
                        
                        VStack(alignment: .leading){
                            Text("Your Device is Protected")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.black)
                            
                            Text("Everything looks safe today")
                                .font(.callout)
                                .foregroundStyle(Color.redPink)
                        }
                        
                        Spacer()
                        
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1.5)
                        
                    )
                    
                    Button{
                         currentPage = 12
                    }label: {
                        VStack{
                            Image("ScanAMessage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            Text("Scan a message")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.white)
                            
                            Text("Check for scams of fraud")
                                .font(.title3)
                                .foregroundStyle(Color.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.redPink)
                        .cornerRadius(20)
                    }
                    
                    HStack(spacing: 20){
                        Button{
                            // currentPage =
                        }label: {
                            VStack{
                                Image("CheckNews")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(Color.pinn.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                Text("Check News")
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(Color.black)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1.5)
                            )
                        }
                        
                        Button{
                            // currentPage =
                        }label: {
                            VStack{
                                Image("ReportScam")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(Color.pinn.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                Text("Report Scam")
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(Color.black)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1.5)
                                )
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10){
                        HStack{
                            Image("Light")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding()
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading){
                                Text("Tip of the day")
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(Color.black)
                            }
                        }
                        .padding()
                        
                        VStack(alignment: .leading){
                            Text("Never share your bank passwords or verification codes with anyone over the phone, even if they claim to be from the bank.")
                                .font(.callout)
                                .foregroundStyle(Color.black)
                                .multilineTextAlignment(.center)
                        }
            
                    }
                    .background(Color.gray.opacity(0.1))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1.5)
                    )
                }
                .padding(.bottom, 12)
            }
            
            HStack(spacing: 10){
                VStack{
                    Button{
                        currentPage = 8
                    }label: {
                        Image("Home")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                    
                    Text("Home")
                        .font(.callout)
                        .foregroundStyle(Color.white)
                }
                .padding()
                
                VStack{
                    Button{
                        //currentPage =
                    }label: {
                        Image("Device")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                    
                    Text("Device Status")
                        .font(.callout)
                        .foregroundStyle(Color.white)
                }
                .padding()
                
                VStack{
                    Button{
                        currentPage = 11
                    }label: {
                        Image("Learning")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                    
                    Text("Learning")
                        .font(.callout)
                        .foregroundStyle(Color.white)
                }
                .padding()
                
                VStack{
                    Button{
                        //currentPage =
                    }label: {
                        Image("Discover")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                    
                    Text("Discover")
                        .font(.callout)
                        .foregroundStyle(Color.white)
                }
                .padding()
            }
            .background(.black)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 8)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    Homepage(
        currentPage: .constant(9),
        userName: .constant("")
    )
}
