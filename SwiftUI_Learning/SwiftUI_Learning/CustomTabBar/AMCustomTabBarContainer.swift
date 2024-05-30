//
//  AMCustomTabBarContainer.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 21/05/24.
//

import SwiftUI

struct AMCustomTabBarContainer<Content: View>: View {
        
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .bottom) {
                content
                    .ignoresSafeArea()
                AMCustomTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct AMCustomTabBarContainer_Preview: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: .red),
        TabBarItem(iconName: "heart", title: "Favorites", color: .blue),
        TabBarItem(iconName: "person", title: "Profile", color: .green)
    ]
    
    static var previews: some View {
        AMCustomTabBarContainer(selection: .constant(tabs.first!), content: {
            Color.red
        })
    }
}
