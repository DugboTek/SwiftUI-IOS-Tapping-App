//
//  TappingApp.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/7/22.
//

import SwiftUI

@main
struct TappingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
