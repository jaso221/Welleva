
//  ContentView.swift
//  Welleva
//
//  Created by Ojas Satarkar on 16/7/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var animateShield = false
    @State private var animateCircles = false
    @State private var animateIcons = false
    @State private var animateButton = false
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                Text("Welcome to")
                    .font(.system(size: 50))
                    .bold()
                
                Text("SafeGuard")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                    .bold()
                
                Text("Your digital companion for a safer online experience")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
            }
            
            Spacer()
            
            ZStack{
                Circle()
                    .fill(Color(red: 252/255, green: 245/255, blue: 246/255))
                    .frame(width: 300, height: 300)
                    .scaleEffect(animateCircles ? 1.0 : 0.5)
                    .opacity(animateCircles ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0), value: animateCircles)
                
                Circle()
                    .fill(Color(red: 247/255, green: 229/255, blue: 230/255))
                    .frame(width: 250, height: 250)
                    .scaleEffect(animateCircles ? 1.0 : 0.5)
                    .opacity(animateCircles ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0), value: animateCircles)
                
                Circle()
                    .fill(Color(red: 255/255, green: 228/255, blue: 230/255))
                    .frame(width: 200, height: 200)
                    .scaleEffect(animateCircles ? 1.0 : 0.5)
                    .opacity(animateCircles ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0), value: animateCircles)
                
                Circle()
                    .fill(Color(red: 251/255, green: 113/255, blue: 133/255))
                    .frame(width: 180, height: 180)
                    .scaleEffect(animateCircles ? 1.0 : 0.5)
                    .opacity(animateCircles ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0), value: animateCircles)
                
                Image("Shield")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .scaleEffect(animateShield ? 1.0 : 0.5)
                    .opacity(animateShield ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0), value: animateShield)
              
                ZStack{
                    Image("WelcomeText")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(10)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(x: -100, y: 80)
                        
                    
                    Image("WelcomeQuestion")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(10)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(x: 100, y: -80)
                }
                .scaleEffect(animateIcons ? 1.0 : 0.5)
                .opacity(animateIcons ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 1.0), value: animateIcons)
            }
            
            Spacer()
            
            VStack{
                NavigationLink(destination: IntroView()){
                        Text("Get Started")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.white)
                            .bold()
                            .frame(width: UIScreen.main.bounds.width * 2/3)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                }
                
                HStack{
                    
                    NavigationLink(destination: EncryptedView()){
                        Image("WelcomeGlobal")
                            .offset(x: -35)
                        
                        Text("Encrypted")
                            .font(Font.system(size: 20))
                            .foregroundStyle(Color.gray)
                            .offset(x: -30)
                    }
                    NavigationLink(destination: PrivacyFirst()){
                        Image("WelcomePrivacy")
                            .offset(x: 15)
                        
                        Text("Privacy First")
                            .font(Font.system(size: 20))
                            .foregroundStyle(Color.gray)
                            .offset(x: 20)
                    }
                }
            }
            .padding(.bottom, 40)
            .scaleEffect(animateButton ? 1.0 : 0.5)
            .opacity(animateButton ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 1.0), value: animateButton)

        }
        .onAppear {
            animateShield = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                animateCircles = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                animateIcons = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                animateButton = true
            }
        }
    }
}

#Preview {
    ContentView()
}
