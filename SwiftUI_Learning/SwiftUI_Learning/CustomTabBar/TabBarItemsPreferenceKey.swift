//
//  TabBarItemsPreferenceKey.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 21/05/24.
//

import Foundation
import SwiftUI

struct TabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
    
}

struct TabBarItemViewModifire: ViewModifier {
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        
        self.modifier(TabBarItemViewModifire(tab: tab, selection: selection))
    }
}
