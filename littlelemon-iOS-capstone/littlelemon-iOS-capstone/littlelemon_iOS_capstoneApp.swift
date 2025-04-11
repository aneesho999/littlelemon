//
//  littlelemon_iOS_capstoneApp.swift
//  littlelemon-iOS-capstone

//

import SwiftUI

@main
struct littlelemon_iOS_capstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
