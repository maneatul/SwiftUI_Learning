//
//  CustomNavLink.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 22/05/24.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(destination:
                        CustomNavBarContainerView { destination }
            .toolbar(.hidden, for: .navigationBar)
                        , label: {
            label
        })
        
    }
}

#Preview {
    CustomNavView {
        CustomNavLink(destination: Text("Destination"), label: {Text("Click Me")})

    }
}
