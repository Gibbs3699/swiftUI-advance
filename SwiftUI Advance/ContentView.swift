//
//  ContentView.swift
//  SwiftUI Advance
//
//  Created by admin on 14/1/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var editingEmailTextfield: Bool = false
    @State private var editingPasswordTextfield: Bool = false
    
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
                        TextfieldIcon(iconName: "envelope.open.fill", currentlyEditing: $editingEmailTextfield)
                        
                        TextField("Email", text: $email) {
                            isEditing in
                            editingEmailTextfield = isEditing
                            editingPasswordTextfield = false
                        }
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
                        TextfieldIcon(iconName: "key.fill", currentlyEditing: $editingPasswordTextfield)
                        SecureField("Password", text: $password) {}
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
                    .onTapGesture {
                        editingPasswordTextfield = true
                        editingEmailTextfield = false
                    }
                    
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
