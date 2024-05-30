//
//  AMViewBuilder.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 20/05/24.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
                
                if let iconName = iconName {
                    Image(systemName: iconName)
                }
            }
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<CustomType: View>: View {
    
    let title: String
    let content: CustomType

    init(title: String, @ViewBuilder content: () -> CustomType) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content: View> : View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}


struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder
    private var headerSection: some View {
        
        switch type {
        case .one: ViewOne
        case .two: ViewTwo
        case .three: ViewThree
        }
        
    }
    
    private var ViewOne: some View {
        Text("One!")
    }
    
    private var ViewTwo: some View {
        VStack {
            Text("Two!")
            Image(systemName: "heart.fill")
        }
    }
    
    private var ViewThree: some View {
        Text("Three!")
    }
}


struct AMViewBuilder: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New Title", description: "Hello", iconName: "heart.fill")
            HeaderViewRegular(title: "New Title", description: "Hello", iconName: nil)
//            
//            HeaderViewGeneric(title: "Generic Title", content: Text("Helloo"))
//            
//            HeaderViewGeneric(title: "Generic Title", content: VStack(content: {
//                Text("Helloo")
//                Image(systemName: "bolt.fill")
//            }))
            
            
            HeaderViewGeneric(title: "Generic Title" ) {
                VStack(alignment: .leading) {
                    HStack {
                            Text("Helloo")
                            Image(systemName: "bolt.fill")
                        
                    }
                    Text("Hello from generic view")
                }
            }
            
            CustomHStack {
                Text("Hello")
                Text("Hi")
                Text("Hi")
            }
            
            Divider()
            
            LocalViewBuilder(type: .two)
            
            Spacer()
        }
    }
}

#Preview {
    AMViewBuilder()
}
