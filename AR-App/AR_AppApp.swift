//
//  AR_AppApp.swift
//  AR-App
//
//  Created by Mathan Jeya on 12/06/2021.
//

import SwiftUI

@main
struct AR_AppApp: App {
    @StateObject var placementSettings = PlacementSettings()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placementSettings)
        }
    }
}
