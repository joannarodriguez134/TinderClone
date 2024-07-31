//
//  MainTabBar.swift
//  TinderClone
//
//  Created by Joanna Rodriguez on 7/30/24.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            Text("SwipingView")
                .tabItem { Image(systemName: "flame") }
                .tag(0)
            
            Text("SearchView")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            Text("InboxView")
                .tabItem { Image(systemName: "bubble") }
                .tag(2)
            
            Text("ProfileView")
                .tabItem { Image(systemName: "person") }
                .tag(3)
            
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabBar()
}
