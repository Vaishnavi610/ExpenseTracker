//
//  TaskManagementAppApp.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 29/01/24.
//

import SwiftUI

@main
struct TaskManagementAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}