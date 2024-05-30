//
//  AMTransition.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 18/05/24.
//

import SwiftUI

struct RotateViewModifire: ViewModifier {
    let rotation: Double
    
    let direction: RotationDirection
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? direction == .right ? UIScreen.main.bounds.width : -UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.width : 0
            )
    }
}

enum RotationDirection {
    case left
    case right
}

extension AnyTransition {
    
    static var rotating: AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifire(rotation: 180, direction: .right),
            identity: RotateViewModifire(rotation: 0, direction: .right))
    }
    
    static func rotating(amount: Double) -> AnyTransition {
        return AnyTransition.modifier(active: RotateViewModifire(rotation: amount, direction: .right),
                                      identity: RotateViewModifire(rotation: 0, direction: .right))
    }
    
    static func rotating(direction: RotationDirection) -> AnyTransition {
        
        return AnyTransition.modifier(active: RotateViewModifire(rotation: 360, direction: direction),
                                      identity: RotateViewModifire(rotation: 0, direction: direction))
    }
    
    static var rotateLeftRight: AnyTransition {
        return AnyTransition.asymmetric(
            insertion: .rotating(direction: .left),
            removal: .rotating(direction: .right))
    }
}

struct AMTransition: View {
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showRectangle {
//                RoundedRectangle(cornerRadius: 25)
                VStack(alignment: .center) {
                    Text("Hello")
//                    RoundedRectangle(cornerRadius: 20)
                }
                .foregroundStyle(Color.black)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
//                    .transition(.rotating(amount: 360))
                    .transition(.rotateLeftRight)
            }
           
            Spacer()
            Text("Click Me")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3) ,radius: 10, x: 0.0, y: 10)
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.default) {
                        showRectangle.toggle()
                    }
                }

        }
    }
}

#Preview {
    AMTransition()
}
