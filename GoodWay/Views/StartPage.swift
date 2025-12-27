//
//  StartPage.swift
//  GoodWay
//
//  Created by Daniel Asamudo on 2025-12-26.
//

import SwiftUI

struct StartPage: View {
    @ObservedObject var settings: UserSettings
    @ObservedObject var sensitiveInfo: SensitiveInfo
    @State var incorrectPassAlert = false
    var body: some View {
        
        if (settings.loggedIn) {
            ContentView(settings: settings)
        } else {
            
            VStack {
                
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Sign In Page")
                    .font(.title)
                
                TextField("Email Goes Here...", text: $settings.emailAddress)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.leading, 10)
                    .frame(maxWidth: 300, maxHeight: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.green, style: StrokeStyle(
                                lineWidth: 3
                            ))
                    )
                    .padding(10)
                SecureField("Password Goes Here...", text: $settings.password)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.leading, 10)
                    .frame(maxWidth: 300, maxHeight: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.green, style: StrokeStyle(
                                lineWidth: 3
                            ))
                    )
                    .padding(.bottom, 20)
                    .alert("Incorrect Email or Password.", isPresented: $incorrectPassAlert) {
                        Button("Acknowledge", role: .cancel) {}
                    } message: {
                        Text("Please enter a different email or password to continue.")
                    }
                Button("Sign In") {
                    if (zip(sensitiveInfo.usernames, sensitiveInfo.passwords).contains {$0 == settings.emailAddress && $1 == settings.password} ) {
                        settings.loggedIn = true
                    } else {
                        incorrectPassAlert = true
                        
                    }
                        
                    }
                }
            }
        
        }
        
    }

#Preview {
    StartPage(settings: UserSettings(), sensitiveInfo: SensitiveInfo())
}
