//
//  AMButtonStyle.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 09/05/24.
//

import SwiftUI

struct ButtonCustomStyle: ButtonStyle {
 
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.5 : 1.0 )
    }
    
}

struct AMButtonStyle: View {
    var body: some View {
        Button(action: {
    
        }, label: {
            Text("Click me")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3) ,radius: 10, x: 0.0, y: 10)
            
        })
        .buttonStyle(ButtonCustomStyle())
        .padding()
    }
}

#Preview {
    AMButtonStyle()
}
