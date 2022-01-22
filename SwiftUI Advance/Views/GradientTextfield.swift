//
//  GradientTextfield.swift
//  SwiftUI Advance
//
//  Created by admin on 21/1/2565 BE.
//

import SwiftUI

struct GradientTextfield: View {
    @Binding var editingTextfield: Bool
    @Binding var textfieldString: String
    @Binding var iconBounce: Bool
    var textfieldPlaceholder: String
    var textfieldIconString: String
    private let generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        HStack(spacing: 12.0) {
            TextfieldIcon(iconName: textfieldIconString, passedImage: .constant(nil), currentlyEditing: $editingTextfield)
                .scaleEffect(iconBounce ? 1.2 : 1.0)
            TextField(textfieldPlaceholder, text: $textfieldString) { isEditing in
                editingTextfield = isEditing
                if isEditing {
                    generator.selectionChanged()
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                        iconBounce.toggle()
                    }

                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5).delay(0.15)) {
                        iconBounce.toggle()
                    }
                }
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
        .background(
            Color(red: 26/255, green: 20/255, blue: 51/255)
                .cornerRadius(16.0)
        )
    }
}

struct GradientTextfield_Previews: PreviewProvider {
    static var previews: some View {
        GradientTextfield(editingTextfield: .constant(false), textfieldString: .constant(""), iconBounce: .constant(false), textfieldPlaceholder: "Placeholder Text", textfieldIconString: "textformat.alt")
    }
}
