//
//  AMMAtchGeometryEffect.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 18/05/24.
//

import SwiftUI

struct AMMAtchGeometryEffect: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 100, height: 100)
            }
           
            Spacer()
            if isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut)  {
                isClicked.toggle()
            }
        }
    }
}

#Preview {
    AMMAtchGeometryEffectExample2()
}


struct AMMAtchGeometryEffectExample2: View {
    
    @Namespace private var namespace2
    let categories: [String] = ["Home", "Popular","Saved"]
    @State private var selected: String = ""
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .center) {
//                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.3))
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
//                            .frame(width: 45, height: 2)
//                            .offset(y: 10)
                    }
                    
                    Text(category)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
