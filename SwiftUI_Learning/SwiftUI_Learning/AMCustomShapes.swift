//
//  AMCustomShapes.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 18/05/24.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            
        }
    }
}

struct AMCustomShapes: View {
    var body: some View {
        ZStack {
            Diamond()
//                .stroke(style: .init(lineWidth: 5, lineCap: .round, dash: [10]))
//                .rotation(.degrees(180))
                .foregroundColor(.blue)
                .frame(width: 300, height: 300)
            
        }
    }
}

#Preview {
    AMCustomShapes()
}
