//
//  GoodWayApp.swift
//  GoodWay
//
//  Created by Daniel Asamudo on 2025-12-25.
//

import SwiftUI

@main
struct GoodWayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(settings: UserSettings())
        }
    }
}
