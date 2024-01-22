//
//  ExpenseTrackerAppApp.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 22/01/24.
//

import SwiftUI

@main
struct ExpenseTrackerAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
