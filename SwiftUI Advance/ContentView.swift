//
//  ContentView.swift
//  SwiftUI Advance
//
//  Created by admin on 14/1/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    
    var body: some View {
        ZStack {
            Image("background-3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading, spacing: 16.0) {
                    Text("Sign Up")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.white)
                    Text("Access My World!")
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.7))
                    
                    HStack {
                        Spacer()
                        Image(systemName: "envelope.open.fill")
                            .foregroundColor(.white)
                        
                        TextField("Email", text: $email)
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 1.0)
                        .blendMode(.overlay)
                    )
                    .background(Color("secondaryBackground").opacity(0.5))
                    .cornerRadius(16.0)
                    .opacity(0.8)
                    
                    HStack {
                        Spacer()
                        Image(systemName: "key.fill")
                            .foregroundColor(.white)
                        TextField("Password", text: $email)
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.password)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 1.0)
                        .blendMode(.overlay)
                    )
                    .background(Color("secondaryBackground").opacity(0.5))
                    .cornerRadius(16.0)
                    .opacity(0.8)
                    
                    GradientButton()
                    
                    
                    Text("By clicking on Sign Up, you must agree to our Terms of servicec and Privacy policy")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.7))
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.white.opacity(0.1))
                    
                    VStack(alignment: .leading, spacing: 16.0){
                        Button(action: {
                            print("Switch on Sign In")
                        }, label: {
                            HStack(spacing: 4.0) {
                                Text("Aleady have an account?")
                                    .font(.footnote)
                                    .foregroundColor(Color.white.opacity(0.7))
                                
                                GradientText(text: "Sign In")
                                    .font(Font.footnote.bold())
                            }
                        })
                    }
                }
                .padding(20)
            }
            .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white.opacity(0.2))
                .background(Color("secondaryBackground").opacity(0.5))
                .background(VisualEffectBlur(blurStyle: .systemMaterialDark))
                .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
            )
            .cornerRadius(30.0)
            .padding(.horizontal)
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    //                                      Array of colors, return View
    public func gradientForeground(colors : [Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomLeading))
            .mask(self)
    }
}

struct GradientText: View {
    var text: String = "Text here"
    var body: some View {
        Text(text)
            .gradientForeground(colors: [Color("pink-gradient-1"),Color("pink-gradient-2")])
    }
}

struct GradientButton: View {
    
    var gradient1: [Color] = [
        Color.init(red: 101/255, green: 134/255, blue: 1),
        Color.init(red: 1, green: 64/255, blue: 80/255),
        Color.init(red: 109/255, green: 1, blue: 185/255),
        Color.init(red: 39/255, green: 232/255, blue: 1),
    ]
    
    var body: some View {
        Button(action: {
            print("Sign Up")
        }, label: {
            //Create button sign in
            GeometryReader() { geometry in
                ZStack {
                    AngularGradient(gradient: Gradient(colors: gradient1), center: .center, angle: .degrees(0))
                        .blendMode(.overlay)
                        .blur(radius: 8.0)
                        .mask(RoundedRectangle(cornerRadius: 16.0)
                                .frame(height: 50)
                                .frame(maxWidth: geometry.size.width - 16)
                                .blur(radius: 8.0)
                        )
                    
                    GradientText(text: "Sign Up")
                        .font(.headline)
                        .frame(width: geometry.size.width - 16)
                        .frame(height: 50)
                        .background(Color("tertiaryBackground")).opacity(0.9)
                    //button bouder
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1.9)
                                .blendMode(.normal)
                                .opacity(0.7)
                        )
                        .cornerRadius(16.0)
                }
            }
            .frame(height: 50.0)
        })
    }
}
