//
//  AMAppTabBarView.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 21/05/24.
//

import SwiftUI

struct AMAppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: .red)
    
    var body: some View {
        AMCustomTabBarContainer(selection: $tabSelection, content: {
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: .red), selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Favorites", color: .blue), selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: TabBarItem(iconName: "person", title: "Profile", color: .green), selection: $tabSelection)            
        })
    }
}

extension AMAppTabBarView {
   
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")

                }
        }
    }
}


struct AMAppTabBarView_Preview: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: .red),
        TabBarItem(iconName: "heart", title: "Favorites", color: .blue),
        TabBarItem(iconName: "person", title: "Profile", color: .green)
    ]
    
    static var previews: some View {
        AMAppTabBarView()
    }
}
