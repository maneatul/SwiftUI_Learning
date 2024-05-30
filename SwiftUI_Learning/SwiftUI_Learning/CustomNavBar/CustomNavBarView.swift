//
//  CustomNavBarView.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 22/05/24.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let howBackButton: Bool
    let title: String
    let subTitle: String?

    var body: some View {
        HStack {
            if howBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            backButton
            .opacity(0)
        }
        .padding()
        .tint(.white)
        .foregroundStyle(Color.white)
        .font(.headline)
        .background(Color.blue)
    }
}

extension CustomNavBarView {
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    
    private var titleSection: some View {
        VStack(spacing: 4, content: {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subTitle = subTitle {
                Text(subTitle)
            }
        })
    }
    
}

#Preview {
    VStack {
        CustomNavBarView(howBackButton: true, title: "title", subTitle: "subtitle")
        Spacer()
    }
}
