//
//  AMPreferenceKey.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 21/05/24.
//

import SwiftUI

struct RectangleGeometryPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
}

extension View {
    
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometryPreferenceKey.self, value: size)
    }
}

struct AMPreferenceKey: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            
            Text("Hello, World!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
                
            
            Spacer()
            
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                        .overlay {
                            Text("\(geo.size.width)")
                                .foregroundStyle(Color.white)
                        }
                }
                 
                Rectangle()
            }
            .frame(height: 55)
        }.safeAreaPadding(5)
        .onPreferenceChange(RectangleGeometryPreferenceKey.self, perform: { value in
            self.rectSize = value
        })
    }
}

#Preview {
    AMPreferenceKey()
}
