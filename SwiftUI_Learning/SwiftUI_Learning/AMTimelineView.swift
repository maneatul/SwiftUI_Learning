//
//  AMTimelineView.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 24/05/24.
//

import SwiftUI

struct AMTimelineView: View {
    
    @State private var pausedAnimation: Bool = false
    @State private var startTime: Date = .now
    
    var body: some View {
        
        VStack {
            TimelineView(.everyMinute ) { context in
                
                Text("\(context.date)")
                Text("\(context.date.timeIntervalSince1970)")
                
//                let seconds = Calendar.current.component(.second, from: context.date)
                let seconds = context.date.timeIntervalSince(startTime)
                
                if context.cadence == .live {
                    Text("cadence : live")
                } else if context.cadence == .minutes {
                    Text("cadence : minutes")
                } else if context.cadence == .seconds {
                    Text("cadence : seconds")
                }
                
                Rectangle()
                    .frame(width: seconds < 10 ? 50 : seconds < 30 ? 200 : 400, height: 100)
                    .animation(.bouncy, value: seconds)
                
                
                Button(pausedAnimation ? "Play": "Pause", action: {
                    pausedAnimation.toggle()
                })
            }
            
        }
    }
}

#Preview {
    AMTimelineView()
}
