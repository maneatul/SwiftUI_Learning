//
//  AMAnimateableData.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 20/05/24.
//

import SwiftUI

struct RectangleWithSingleCornerAnimation: Shape {
    
    var cornerRadius: CGFloat

    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
       
    }
    
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            path.move(to: .zero)
            path.addLine(to: .init(x: rect.maxX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(0),
                endAngle: .degrees(180),
                clockwise: false)
            
            path.addLine(to: .init(x: rect.maxX - cornerRadius, y: rect.maxY))
            
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.minY))
        }
    }
}


struct PacManAnimation: Shape {
    
    var offsetAmount: Double
    
    var animatableData: Double
    {
        get { offsetAmount }
        set { offsetAmount = newValue}
    }
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.midX, y: rect.midY))
            path.addArc(
                center: .init(x: rect.midX, y: rect.midY),
                radius: rect.height/2,
                startAngle: .degrees(offsetAmount),
                endAngle: Angle(degrees: 360-offsetAmount),
                clockwise: false)
        }
    }
}


struct AMAnimateableData: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: animate ? 60 : 0)
//            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
            PacManAnimation(offsetAmount: animate ? 30 : 0)
                .frame(width: 250, height: 250)
        }
        .onAppear {
            withAnimation(Animation.easeInOut.repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    AMAnimateableData()
}
