//
//  MainMenu.swift
//  GoodWay
//
//  Created by Daniel Asamudo on 2025-12-27.
//

import SwiftUI

struct MainMenu: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Schedule Placeholder")
                .tabItem {
                    Image(systemName: "book")
                    Text("Schedule")
                }
                .tag(0)
            Text("Tasks Placeholder")
                .tabItem {
                    Image(systemName: "checklist")
                    Text("Tasks")
                }
                .tag(1)
            Text("Options Placeholder")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Options")
                }
                .tag(2)
        }
        .tint(.green)
    }
}

#Preview {
    MainMenu()
}
