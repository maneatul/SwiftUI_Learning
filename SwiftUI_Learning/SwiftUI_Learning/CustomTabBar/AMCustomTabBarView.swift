//
//  AMCustomTabBarView.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 21/05/24.
//

import SwiftUI

struct AMCustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    
    var body: some View {
        tabBarVersion2
    }
}


struct TabBarItem: Hashable {
    let iconName: String
    let title: String
    let color: Color
}

extension AMCustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : .gray)
        .padding()
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var tabBarVersion1: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                    tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
}

extension AMCustomTabBarView {
    
    private func tabView2(tab: TabBarItem) -> some View {
        
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : .gray)
        .padding()
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                if selection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rect", in: namespace)
                }
            })
    }
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                    tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

struct AMCustomTabBarView_Preview: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: .red),
        TabBarItem(iconName: "heart", title: "Favorites", color: .blue),
        TabBarItem(iconName: "person", title: "Profile", color: .green)
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            AMCustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}
