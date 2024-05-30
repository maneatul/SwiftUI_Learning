//
//  AMAppNavBarView.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 22/05/24.
//

import SwiftUI

struct AMAppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                CustomNavLink(destination: 
                                Text("Destination")
                    .customNavigationTitle("Secont Title")
                    .customNavigationSubTitle("Second Subtitle")
, label: {
                    Text("Navigate")
                })
            }
            .customNavBarItem(title: "My Title", subTitle: "My Subtitle", backButtonHidden: true)
        }
    }
}


extension AMAppNavBarView {
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink(destination:
                                Text("Destination")
                                    .navigationTitle("Title 2")
//                                    .navigationBarBackButtonHidden(true)
                               
                               , label: {
                    Text("Navigate")
                })
            }
            .navigationTitle("New Title")
        }
    }
}

#Preview {
    AMAppNavBarView()
}
