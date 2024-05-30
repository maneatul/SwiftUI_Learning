//
//  CustomNavBarContainerView.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 22/05/24.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subTitle: String? = nil

    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(howBackButton: showBackButton, title: title, subTitle: subTitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubTitlePreferenceKey.self, perform: { value in
            self.subTitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

#Preview {
    CustomNavBarContainerView {
        ZStack {
            Color.green.ignoresSafeArea()
            Text("Hello, World!")
        }
        .customNavigationTitle("My Title")
        .customNavigationSubTitle("My sub title")
        .customNavigationBarBackButtonHidden(true)
    }
}
