//
//  SwiftUI_AdvanceApp.swift
//  SwiftUI Advance
//
//  Created by admin on 14/1/2565 BE.
//

import SwiftUI

@main
struct SwiftUI_AdvanceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
