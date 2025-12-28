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
        NavigationSplitView {
            VStack {
                if (settings.loggedIn) {
                    Button {
                        
                    } label: {
                        Text("Math")
                            .frame(maxWidth: 400, maxHeight: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, style: StrokeStyle(lineWidth: 3))
                                )
                    }
                } else {
                    SignInPage(settings: UserSettings(), sensitiveInfo: SensitiveInfo())
                }
                
            }
            .padding()
        } detail: {
            Text("Please Select an option")
        }
    }
}

#Preview {
    @Previewable @State var isLoggedIn = UserSettings()
    ContentView(settings: isLoggedIn)
}
