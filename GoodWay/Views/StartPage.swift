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
                    Spacer()
                    HStack {
                        Text("GoodWay")
                            .font(.system(size: 60))
                            .foregroundStyle(Color("AccentColor"))
                            .fontWeight(.semibold)
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("AccentColor"))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    NavigationLink {
                        SignInPage(settings: UserSettings(), sensitiveInfo: SensitiveInfo())
                    } label: {
                        HStack {
                            Text("Get Started")
                                .font(.title2)
                                .foregroundStyle(.white)
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: 300, maxHeight: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color("AccentColor"))
                            )
                    }
                    .padding(10)
                }
            }
        }
    }
}

#Preview {
    StartPage()
}
