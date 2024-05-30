//
//  CustomNavView.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 22/05/24.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
#Preview {
    CustomNavView {
        Color.red.ignoresSafeArea()
    }
}
