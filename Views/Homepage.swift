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
    
<<<<<<< HEAD
    @State private var fullName: String = ""
    
    var body: some View{
        
        VStack(spacing: 0){
=======
    var body: some View {
        VStack(spacing: 0) {
>>>>>>> firebase
            
            HStack {
                
                Button {
                    currentPage = 9
                } label: {
                    Image("Setting")
                        .resizable()
<<<<<<< HEAD
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
=======
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .background(Color.white.opacity(0.1))
>>>>>>> firebase
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
<<<<<<< HEAD
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
=======
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.white.opacity(0.1))
>>>>>>> firebase
                            .clipShape(Circle())
                    }
                    
                    Button {
                        currentPage = 13
                    } label: {
                        Image("Size")
                            .resizable()
<<<<<<< HEAD
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
=======
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.white.opacity(0.1))
>>>>>>> firebase
                            .clipShape(Circle())
                    }
                    
                    Button {
                        currentPage = 14
                    } label: {
                        Image("Colour")
                            .resizable()
<<<<<<< HEAD
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
=======
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.white.opacity(0.1))
>>>>>>> firebase
                            .clipShape(Circle())
                    }
                }
            }
<<<<<<< HEAD
            .padding(.top, 8)
            .background(.black)
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(edges: .top)
         
            ScrollView{
                
                VStack(alignment: .leading, spacing: 20){
=======
            .padding()
            .background(Color.black)
            
            ScrollView {
                VStack(spacing: 20) {
>>>>>>> firebase
                    
                    HStack {
                        Image("User")
                            .resizable()
<<<<<<< HEAD
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60,height: 60)
=======
                            .frame(width: 50, height: 50)
>>>>>>> firebase
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
<<<<<<< HEAD
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
=======
                            .frame(width: 40, height: 40)
>>>>>>> firebase
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
                    
<<<<<<< HEAD
                    Button{
                         currentPage = 12
                    }label: {
                        VStack{
                            Image("ScanAMessage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
=======
                    Button {
                        currentPage = 10
                    } label: {
                        VStack(spacing: 12) {
                            Image("ScanAMessage")
                                .resizable()
                                .frame(width: 40, height: 40)
>>>>>>> firebase
                            
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
                    
<<<<<<< HEAD
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
=======
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
>>>>>>> firebase
                        
                        Text("Never share your bank passwords or verification codes with anyone over the phone, even if they claim to be from the bank.")
                            .foregroundColor(.black)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
<<<<<<< HEAD
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
=======
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
>>>>>>> firebase
        }
    }
}

#Preview {
    HomePage(currentPage: .constant(0), userName: "Wei")
}
