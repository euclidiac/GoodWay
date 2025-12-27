//
//  ContentView.swift
//  GoodWay
//
//  Created by Daniel Asamudo on 2025-12-25.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var loggedIn: Bool = false
    @Published var emailAddress: String = ""
    @Published var password: String = "" 
    
}
struct ContentView: View {
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack {
            if (settings.loggedIn) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            } else {
                StartPage(settings: UserSettings(), sensitiveInfo: SensitiveInfo())
            }
            
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var isLoggedIn = UserSettings()
    ContentView(settings: isLoggedIn)
}
