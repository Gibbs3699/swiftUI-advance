//
//  SettingView.swift
//  SwiftUI Advance
//
//  Created by admin on 21/1/2565 BE.
//

import SwiftUI

struct SettingView: View {
    @State private var editingNameTextfield = false
    @State private var editingTwitterTextfield = false
    @State private var editingSiteTextfield = false
    @State private var editingBioTextfield = false
    @State private var nameIconBounce = false
    @State private var twitterIconBounce = false
    @State private var siteIconBounce = false
    @State private var bioIconBounce = false
    @State private var name = ""
    @State private var twitter = ""
    @State private var site = ""
    @State private var bio = ""
    private let generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
