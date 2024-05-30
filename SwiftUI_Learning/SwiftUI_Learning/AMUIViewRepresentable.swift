//
//  AMUIViewRepresentable.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 23/05/24.
//

import SwiftUI

//convert UIView from UIKit to SwiftUI
struct AMUIViewRepresentable: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            Divider()

            TextField("type here ..", text: $text)
            Divider()
            
            UITextFieldViewRepresentable(text: $text, placeHolderColor: .yellow)
                .updatePlaceHolder("New Place holder")
                .frame(height: 55)
                .background(Color.gray)
        }
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
   
    @Binding var text: String
    var placeHolderText: String
    var placeHolderColor: UIColor
    
    init(text: Binding<String>, placeHolderText: String = "Type here..", placeHolderColor: UIColor = .red) {
        self._text = text
        self.placeHolderText = placeHolderText
        self.placeHolderColor = placeHolderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
       let txtField = getTextField()
        txtField.delegate = context.coordinator
        return txtField
    }
    
    //send data from SwiftUI to UIkit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func getTextField() -> UITextField{
        let textField = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: placeHolderText, attributes: [.foregroundColor: placeHolderColor])
        textField.attributedPlaceholder = placeholder
        return textField
    }
    
    func updatePlaceHolder(_ text: String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeHolderText = text
        return viewRepresentable
    }
    
    //send data from UIkit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

#Preview {
    AMUIViewRepresentable()
}
