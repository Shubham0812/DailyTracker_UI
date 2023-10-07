//
//  DailyTracker_UIApp.swift
//  DailyTracker_UI
//
//  Created by Shubham Singh on 07/10/23.
//

import SwiftUI

@main
struct DailyTracker_UIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
