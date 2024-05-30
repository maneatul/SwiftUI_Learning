//
//  AMGenerics.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 20/05/24.
//

import SwiftUI


struct StringModel {
    
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

struct BoolModel {
    
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        BoolModel(info: nil)
    }
}

struct GenericModel<CustomType> {
    let info: CustomType?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello, World!")
    @Published var boolModel = BoolModel(info: true)
    
    @Published var genericStringModel = GenericModel(info: "Hello, Generic World!")
    @Published var genericBoolModel = GenericModel(info: true)

    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericView<CustomType: View>: View {
    
    let content: CustomType
    let title: String
    
    var body: some View {
        Text(title)
        content
    }
}

struct AMGenerics: View {
    
    @StateObject private var vm = GenericViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("Custom Contents"), title: "New View!")
            
            Text(vm.stringModel.info ?? "No Data")
            Text(vm.boolModel.info?.description ?? "No data" )
            
            Text(vm.genericStringModel.info ?? "No Data")
            Text(vm.genericBoolModel.info?.description ?? "No data" )
     
        }
        .onTapGesture {
            vm.removeData()
        }
    }
    
}

#Preview {
    AMGenerics()
}
