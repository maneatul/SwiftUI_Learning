//
//  AMWaterDropShape.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 30/05/24.
//

import SwiftUI

struct DropShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.minX  , y: rect.maxY))
            
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.maxX  , y: rect.maxY))
            
        }
    }
    
    
}

struct AMWaterDropShape: View {
    
    @State private var waterCount: Int = 0
    
    var body: some View {
      Button(action: {
          waterCount += 1
      }, label: {
          DropShape()
               .fill(LinearGradient(colors:  [.white, .blue], startPoint: .top, endPoint: .bottom))
               .frame(width: 200, height: 200)
               .overlay {
                   VStack(alignment: .center) {
                       Spacer()
                       Text("Count: \(waterCount)")
                           .foregroundStyle(Color.black)
                           .padding()
                   }
               }
               
      })
      .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    AMWaterDropShape()
}
