//
//  GradientText.swift
//  SwiftUI Advance
//
//  Created by admin on 15/1/2565 BE.
//

import SwiftUI

struct GradientText: View {
    var text: String = "Text here"
    var body: some View {
        Text(text)
            .gradientForeground(colors: [Color("pink-gradient-1"),Color("pink-gradient-2")])
    }
}

extension View {
    //                                      Array of colors, return View
    public func gradientForeground(colors : [Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomLeading))
            .mask(self)
    }
}

struct GradientText_Previews: PreviewProvider {
    static var previews: some View {
        GradientText()
    }
}
