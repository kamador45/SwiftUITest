//
//  PostDetailModel.swift
//  ZemogaTest
//
//  Created by Kevin Amador Rios on 6/1/22.
//

import Foundation

struct PostDetailModel: Codable, Hashable, Identifiable {
    let id = UUID()
    let postId: Int
    let title: String
    let body: String
    let email: String
}
