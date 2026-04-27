//
//  RandomDecisionAppApp.swift
//  RandomDecisionApp
//
//  Created by Briyana Verdugo on 4/27/26.
//

import SwiftUI
import CoreData

@main
struct RandomDecisionAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
