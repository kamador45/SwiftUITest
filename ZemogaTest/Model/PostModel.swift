//
//  PostModel.swift
//  ZemogaTest
//
//  Created by Kevin Amador Rios on 6/1/22.
//

import Foundation

struct PostModel: Codable, Hashable, Identifiable {
    let id = UUID()
    let title:String
}
