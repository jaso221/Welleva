//
//  IntroView.swift
//  Welleva
//
//  Created by Sichen Wang on 17/7/2026.
//

import SwiftUI

struct IntroView: View {
    @Binding var currentPage: Int
    @State private var animateContent = false
    
    var body: some View {
        
        VStack{
            
            HStack{
                Button{
                    currentPage = 0
                }label: {
                    Image("IntroBack")
                        .font(.title2)
                        .foregroundStyle(Color.black)
                }
                Spacer()
                
                Button("Skip"){
                    currentPage = 6
                }
            }
            .padding()
            
            Spacer()
            
            ZStack{
                Circle()
                    .fill(Color(red: 252/255, green: 245/255, blue: 246/255))
                    .frame(width: 300, height: 300)
                
                Circle()
                    .fill(Color(red: 247/255, green: 229/255, blue: 230/255))
                    .frame(width: 250, height: 250)
                
                Circle()
                    .fill(Color(red: 255/255, green: 228/255, blue: 230/255))
                    .frame(width: 200, height: 200)
                
                Circle()
                    .fill(Color(red: 251/255, green: 113/255, blue: 133/255))
                    .frame(width: 180, height: 180)
                
                Image("Shield")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Image("WelcomeText")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding(8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: -80, y: 60)
                
                Image("WelcomeQuestion")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding(8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: 80, y: -60)
                
                Image("IntroHat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding(8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: 80, y: 60)
            }
            .scaleEffect(animateContent ? 1 : 0.6)
            .opacity(animateContent ? 1 : 0)
            .animation(.easeInOut(duration: 0.8), value: animateContent)
            
            Spacer()
            
            VStack{
                HStack{
                    Text("Stay One Step")
                        .font(.title)
                        .bold()
                    Text("Ahead")
                        .font(.title)
                        .foregroundStyle(.red)
                        .bold()
                }
                
                Text("SafeGuard helps you identify scams, protect your personal data, and learn how to stay safe online with simple, easy-to-follow lessons.")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .opacity(animateContent ? 1 : 0)
            .offset(y: animateContent ? 0 : 20)
            .animation(.easeInOut(duration: 0.8).delay(0.2), value: animateContent)
            
            Spacer()
            
            HStack(spacing: 8){
                Circle().frame(width: 24,height: 8).foregroundStyle(Color.red)
                Circle().frame(width: 8,height: 8).foregroundStyle(Color.gray)
                Circle().frame(width: 8,height: 8).foregroundStyle(Color.gray)
            }
            .padding(.top, 10)
            
            VStack{
                Button(action: {
                    currentPage = 2
                }){
                    Text("Next")
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.white)
                        .frame(width: UIScreen.main.bounds.width * 2/3)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(20)
                }
            }
            .padding(.bottom, 30)
        }
        .onAppear {
            animateContent = true
        }
    }
}

        

#Preview{
    IntroView(currentPage: .constant(4))
}

