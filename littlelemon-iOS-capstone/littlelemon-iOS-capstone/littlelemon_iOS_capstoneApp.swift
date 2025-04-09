//
//  littlelemon_iOS_capstoneApp.swift
//  littlelemon-iOS-capstone
//
//  Created by Aneesh Oak on 09/04/25.
//

import SwiftUI

@main
struct littlelemon_iOS_capstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
