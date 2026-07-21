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
        
        VStack{
            
            HStack{
                Button{
                    //    currentPage =
                }label: {
                    Image("Setting")
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
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                    
                    Button{
                        // currentPage =
                    }label: {
                        Image("Size")
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                    
                    Button{
                        // currentPage =
                    }label: {
                        Image("Colour")
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .background(.black)
            .frame(maxWidth: .infinity)
            .padding()
            
            ScrollView{
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Image("User")
                            .resizable()
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
                            .stroke(Color.pinn, lineWidth: 1.5)
                        
                    )
                }
            }
        }
    }
}

#Preview {
    Homepage(
        currentPage: .constant(9),
        userName: .constant("")
    )
}
