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
                        
                        VStack{
                            Text("Good morning")
                                .font(.title)
                                .bold()
                            
                            Text(userName.isEmpty ? "User" : userName)
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color.redPink)
                            
                        }
                    }
                    .padding()
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
