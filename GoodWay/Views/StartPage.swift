//
//  StartPage.swift
//  GoodWay
//
//  Created by Daniel Asamudo on 2025-12-28.
//

import SwiftUI

struct StartPage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(
                    colors: [Color.green.opacity(0.50), .clear], startPoint: .bottomLeading, endPoint: .topTrailing
                )
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    ZStack {
                        Text("GoodWay")
                            .font(.largeTitle)
                            .foregroundStyle(.green)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    NavigationLink {
                        SignInPage(settings: UserSettings(), sensitiveInfo: SensitiveInfo())
                    } label: {
                        Text("Get Started")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: 300, maxHeight: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.green)
                            )
                    }
                    .padding(10)
                    Text("By proceeding to use GoodWay, you agree to our terms and conditions.")
                        .frame(maxWidth: 300)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                    
                }
            }
        }
    }
}

#Preview {
    StartPage()
}
