//
//  AMDependencyInjection.swift
//  SwiftUI_Learning
//
//  Created by Atul Mane on 23/05/24.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

///Problems with singletons
///1. Singleton's are Global
///2. Can't customize the init
///3.Can't swap out dependencies

class ProductionDataService: DataServiceProtocol {
        
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getdata() -> AnyPublisher<[PostModel], Error>{
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data})
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class MockDataService: DataServiceProtocol {
    
    let testData: [PostModel] 
//    = [
//        PostModel(userId: 1, id: 1, title: "One", body: "one"),
//        PostModel(userId: 2, id: 2, title: "Two", body: "two"),
//        PostModel(userId: 3, id: 3, title: "Three", body: "three")
//    ]
    
    init(data: [PostModel]?) {
        self.testData = data ?? [
                    PostModel(userId: 1, id: 1, title: "One", body: "one"),
                    PostModel(userId: 2, id: 2, title: "Two", body: "two"),
                    PostModel(userId: 3, id: 3, title: "Three", body: "three")
                ]
    }
    
    func getdata() -> AnyPublisher<[PostModel], any Error> {
        
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
    
    
}

protocol DataServiceProtocol {
    func getdata() -> AnyPublisher<[PostModel], Error>
}

class DependencyInjectionViewModel: ObservableObject {
    
    @Published var dataArray: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService: DataServiceProtocol
    
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts(){
        dataService.getdata()
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            })
            .store(in: &cancellables)
    }
}


struct AMDependencyInjection: View {
    
    @StateObject private var vm: DependencyInjectionViewModel
    
    init(dataService: DataServiceProtocol) {
        self._vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(vm.dataArray) { post in
                    VStack {
                        Text(post.title)
                        Divider()
                    }
                }

            }
        }
    }
}

#Preview {
//    AMDependencyInjection(dataService: ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!))
    AMDependencyInjection(dataService: MockDataService(data: nil))
}
