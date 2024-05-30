//
//  CustomNavBarPreferenceKeys.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 22/05/24.
//

import Foundation
import SwiftUI

struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarSubTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}


extension View {
//    .navigationTitle("Title 2")
//                                    .navigationBarBackButtonHidden(true)
    
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }

    func customNavigationSubTitle(_ subTitle: String?) -> some View {
        preference(key: CustomNavBarSubTitlePreferenceKey.self, value: subTitle)
    }
    
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
        
    func customNavBarItem(title: String, subTitle: String?, backButtonHidden: Bool) -> some View {
        self.customNavigationTitle(title)
            .customNavigationSubTitle(subTitle)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
}
