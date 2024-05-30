//
//  AMAnimation.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 13/05/24.
//

import SwiftUI

extension View where Self: Shape {
    
    func glow(fill: some ShapeStyle, lineWidth: Double, blurRadius: Double = 8.0, lineCap:CGLineCap = .round) -> some View {
        self.stroke(style: StrokeStyle(lineWidth: lineWidth/2, lineCap: lineCap))
            .fill(fill)
            .overlay {
                self.stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: lineCap))
                    .fill(fill)
                    .blur(radius: blurRadius)
            }
            .overlay {
                self.stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: lineCap))
                    .fill(fill)
                    .blur(radius: blurRadius/2)
            }
        
    }
}

extension ShapeStyle where Self == AngularGradient {
    static var palette: some ShapeStyle {
        .angularGradient(
          stops: [
            .init(color: .blue, location: 0.0),
            .init(color: .purple, location: 0.2),
            .init(color: .red, location: 0.4),
            .init(color: .mint, location: 0.5),
            .init(color: .indigo, location: 0.7),
            .init(color: .pink, location: 0.9),
            .init(color: .blue, location: 1.0),
          ],
          center: .center,
          startAngle: Angle(radians: .zero),
          endAngle: Angle(radians: .pi * 2)
        )
      }
}

struct AMAnimation: View, Animatable {
    
    @State private var progress1: Double = 0.0
    @State private var progress2: Double = 0.0

    
    var body: some View {
        ZStack {
            ProgressView(progress: progress1)
            ProgressView(progress: progress2)
              .rotationEffect(.degrees(180.0))
          }
        .frame(width: 500, height: 250)
          .onAppear() {
            withAnimation(
              .linear(duration: 2.0)
              .repeatForever(autoreverses: false)
            ) {
              progress1 = 1.0
            }
            withAnimation(
              .linear(duration: 2.0)
              .repeatForever(autoreverses: false)
              .delay(1.0)
            ) {
              progress2 = 1.0
            }
          }
    }
    
}

struct ProgressView: View, Animatable {
  var progress: Double
  private let delay = 0.2

    var animatableData: Double {
       get { progress }
       set { progress = newValue }
     }

  var body: some View {
    Capsule()
      .trim(
        from: {
          if progress > delay {
            progress - delay
          } else {
            .zero
          }
        }(),
        to: progress
      )
      .glow(
        fill: .palette,
        lineWidth: 4.0
      )
  }
}

//#Preview {
//    AMAnimation(progress: )
//}
