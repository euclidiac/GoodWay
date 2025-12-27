//
//  MainMenu.swift
//  GoodWay
//
//  Created by Daniel Asamudo on 2025-12-27.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
            }
            .navigationTitle("GoodWay")
        }
        .navigationBarBackButtonHidden(true)
        .interactiveDismissDisabled(true)

    }
}

#Preview {
    MainMenu()
}
