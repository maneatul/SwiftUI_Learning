//
//  AMUIViewControllerRepresentable.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 23/05/24.
//

import SwiftUI

struct AMUIViewControllerRepresentable: View {
    
    @State private var showScreen: Bool = false
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("Hello")

            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            Button(action: {
                showScreen.toggle()
            }, label: {
                Text("Click me!")
            })
            .sheet(isPresented: $showScreen, content: {
                UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
//                BasicUIViewControllerRepresentable(labelText: "New Text Here")
            })
        }
    }
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    @Binding var showScreen: Bool
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    
    //swiftUI to UIKit
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    //UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    
    class Coordinator:NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var image: UIImage?
        @Binding var showScreen: Bool

        init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            image = newImage
            showScreen = false
        }
    }
}

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
       let vc = MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class MyFirstViewController: UIViewController {
    
    var labelText: String = "Initial value"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        
        view.addSubview(label)
        label.frame = view.frame
        
    }
}

#Preview {
    AMUIViewControllerRepresentable()
}



