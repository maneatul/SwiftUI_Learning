//
//  AMCustomCurves.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 19/05/24.
//

import SwiftUI

struct ArcSample: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height/2,
                startAngle: .degrees(0),
                endAngle: .degrees(40),
                clockwise: true)
        }
    }
}

struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY - 50),
                radius: rect.height/2,
                startAngle: .degrees(0),
                endAngle: .degrees(180),
                clockwise: false)
            
            path.addLine(to:  CGPoint(x: rect.minX, y: rect.minY))
            
         }
    }
}

struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path {path in
            path.move(to: .zero)
            path.addQuadCurve(to: .init(x: rect.midX, y: rect.midY), control: .init(x: rect.minX, y: rect.maxY))
            
        }
    }
}

struct WaterShape: Shape  {
    func path(in rect: CGRect) -> Path {
        Path {path in
            path.move(to: .init(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: .init(x: rect.width * 0.25, y: rect.height * 0.40))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: .init(x: rect.width * 0.75, y: rect.height * 0.60))
            
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.midY))
            
            
        }
    }
}

struct AMCustomCurves: View {
    var body: some View {
        WaterShape()
//            .stroke(lineWidth: 5)
//            .rotation(.degrees(90))
//            .frame(width: 300, height: 300)
            .fill(
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .ignoresSafeArea()
    }
}


#Preview {
    AMCustomCurves()
}
