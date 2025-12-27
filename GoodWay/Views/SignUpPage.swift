//
//  StartPage.swift
//  GoodWay
//
//  Created by Daniel Asamudo on 2025-12-26.
//

import SwiftUI

struct SignUpPage: View {
    @ObservedObject var settings: UserSettings
    @ObservedObject var sensitiveInfo: SensitiveInfo
    @State var existingUser = false
    var body: some View {
        
        if (settings.loggedIn) {
            ContentView(settings: settings)
        } else {
            
            VStack {
                
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Sign Up Page")
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
                    .alert("EMail is already registered.", isPresented: $existingUser) {
                        Button("Acknowledge", role: .cancel) {}
                    } message: {
                        Text("Please enter a different email or password, or log in.")
                    }
                Button("Sign Up") {
                    if (zip(sensitiveInfo.usernames, sensitiveInfo.passwords).contains {$0 == settings.emailAddress && $1 == settings.password} ) {
                        existingUser = true
                    } else {
                        sensitiveInfo.usernames.append(settings.emailAddress)
                        sensitiveInfo.passwords.append(settings.password)
                        settings.loggedIn = true
                    }
                        
                    }
                }
            .navigationBarBackButtonHidden(true)
            .interactiveDismissDisabled(true)
            }
        
        }
        
    }

#Preview {
    StartPage(settings: UserSettings(), sensitiveInfo: SensitiveInfo())
}
