//
//  StartPage.swift
//  GoodWay
//
//  Created by Daniel Asamudo on 2025-12-26.
//

import SwiftUI

struct SignInPage: View {
    @ObservedObject var settings: UserSettings
    @ObservedObject var sensitiveInfo: SensitiveInfo
    @State var incorrectPassAlert = false
    @State var existingUser = false
    var body: some View {
        
        if (settings.loggedIn) {
            ContentView(settings: settings)
        } else {
            
            NavigationStack {
                ZStack {
                    Color("AppDefaultColours").ignoresSafeArea()
                    Circle()
                        .frame(width: 200)
                        .offset(x: 120, y: -350)
                        .foregroundStyle(Color("AccentColor"))
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                        topLeading: 92,
                        bottomLeading: 41,
                        bottomTrailing: 84,
                        topTrailing:45
                    ))
                    .frame(width: 200, height: 200)
                    .offset(x: -190, y: 100)
                        .foregroundStyle(.blue)
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                        topLeading: 81,
                        bottomLeading: 73,
                        bottomTrailing: 84,
                        topTrailing:53
                    ))
                    .frame(width: 200, height: 200)
                    .offset(x: 190, y: 330)
                        .foregroundStyle(.red)
                    VStack {
                        Text("GoodWay")
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("AccentColor"))
                        TextField("Email Goes Here...", text: $settings.emailAddress)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding(.leading, 10)
                            .frame(maxWidth: 300, maxHeight: 40)
                            .background(Color("AppDefaultColours"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color("AccentColor"), style: StrokeStyle(
                                        lineWidth: 3
                                    ))
                            )
                            .padding(10)
                        SecureField("Password Goes Here...", text: $settings.password)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding(.leading, 10)
                            .frame(maxWidth: 300, maxHeight: 40)
                            .background(Color("AppDefaultColours"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color("AccentColor"), style: StrokeStyle(
                                        lineWidth: 3
                                    ))
                            )
                            .padding(.bottom, 20)
                            .alert("Incorrect Email or Password.", isPresented: $incorrectPassAlert) {
                                Button("Acknowledge", role: .cancel) {}
                            } message: {
                                Text("Please enter a different email or password to continue.")
                            }
                        Button {
                            if (zip(sensitiveInfo.usernames, sensitiveInfo.passwords).contains {$0 == settings.emailAddress && $1 == settings.password} ) {
                                settings.loggedIn = true
                            } else {
                                incorrectPassAlert = true
                                
                            }
                            
                        } label: {
                            Text("Sign In")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .backgroundStyle(Color.green)
                                .frame(maxWidth: 250, maxHeight: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color("AccentColor"))
                                )
                            
                            
                        }
                        .padding(5)
                        NavigationLink {
                            SignUpPage(settings: UserSettings(), sensitiveInfo: SensitiveInfo(), existingUser: existingUser)
                        } label: {
                            Text("Sign Up")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .backgroundStyle(Color.green)
                                .frame(maxWidth: 250, maxHeight: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color("AccentColor"))
                                )
                            
                            
                        }
                        
                    }
                }
            }
            }
        
        }
        
    }

#Preview {
    SignInPage(settings: UserSettings(), sensitiveInfo: SensitiveInfo())
}
