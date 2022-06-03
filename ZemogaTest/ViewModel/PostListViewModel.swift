//
//  PostListViewModel.swift
//  ZemogaTest
//
//  Created by Kevin Amador Rios on 6/1/22.
//

import Foundation
import Combine

class PostListViewModel:ObservableObject {
    
    //init ViewModel
    init() {
        getPost()
    }
    
    @Published var posts = [PostModel] () {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }
    }
    
    //MARK: Start to use combine
    let didChange = PassthroughSubject<PostListViewModel, Never>()
    
    //Ask all info to Network Manager
    func getPost() {
        NetworkManage().getPost { post in
            self.posts = post
        }
    }
    
}
