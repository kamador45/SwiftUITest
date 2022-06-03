//
//  PostDetailListViewModel.swift
//  ZemogaTest
//
//  Created by Kevin Amador Rios on 6/1/22.
//

import Foundation
import Combine

class PostDetailListViewModel:ObservableObject {
    
    //MARK: Init process
    init() {
        getPostDetails()
    }
    
    @Published var details = [PostDetailModel] () {
        didSet {
            self.didChange.send(self)
        }
    }
    
    let didChange = PassthroughSubject<PostDetailListViewModel, Never>()
    
    //MARK: Networking request
    func getPostDetails() {
        NetworkManage().getPostDetails { details in
            self.details = details
        }
    }
}
