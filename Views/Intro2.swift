
//
//  Intro2.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
import SwiftUI

struct Intro2: View {
    @Binding var currentPage: Int
    
    @State private var animateShield = false
    @State private var animateCircles = false
    @State private var animateIcons = false
    @State private var animateButton = false
    
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Button{
                        currentPage = 2
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
                        
                        Rectangle()
                            .fill(Color(red: 255/255 ,green: 228/255, blue: 230/255))
                            .frame(width: 180, height: 180)
                            .cornerRadius(20)
                            .scaleEffect(animateCircles ? 1.0 : 0.5)
                            .opacity(animateCircles ? 1.0 : 0.0)
                            .animation(.easeInOut(duration: 1.0), value: animateCircles)
                        
                        Rectangle()
                            .fill(Color.redPink)
                            .frame(width: 150, height: 150)
                            .cornerRadius(20)
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
                    }
                    
                    ZStack {
                        Image("WelcomeText")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .offset(x: 100, y: -100)
                        
                        Image("WelcomeQuestion")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .offset(x: -100, y: -100)
                        
                        Image("IntroHat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .offset(y: 100)
                    }
                    .scaleEffect(animateIcons ? 1.0 : 0.5)
                    .opacity(animateIcons ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0), value: animateIcons)
                }
                Spacer()
                
                VStack{
                    HStack{
                        Text("Recognise")
                            .font(.title)
                            .bold()
                        Text("Scams")
                            .font(.title)
                            .foregroundStyle(.redPink)
                            .bold()
                    }
                    
                    Text("In-app learning modules help build your confidence using the internet, learn how to recognise scams, and become more confident and independent online.")
                        .font(.callout)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                Spacer()
                
                HStack(spacing: 8){
                    Circle().frame(width: 8,height: 8).foregroundStyle(Color.gray)
                    Circle().frame(width: 8,height: 8).foregroundStyle(Color.gray)
                    Circle().frame(width: 8,height: 8).foregroundStyle(Color.redPink)
                }
                
                VStack{
                    Button(action: {
                        currentPage = 6
                    }){
                        Text("Begin")
                            .font(.title)
                            .bold()
                            .foregroundStyle(Color.white)
                            .frame(width: UIScreen.main.bounds.width * 2/3)
                            .padding()
                            .background(Color.redPink)
                            .cornerRadius(20)
                    }
                    
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
                .padding(.bottom, 30)
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
}

#Preview {
    Intro2(currentPage: .constant(3))
}
