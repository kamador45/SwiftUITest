//
//  NetworkManager.swift
//  ZemogaTest
//
//  Created by Kevin Amador Rios on 6/1/22.
//

import Foundation

class NetworkManage {
    
    //Manage downloads
    func getPost(handler: @escaping([PostModel]) -> ()) {
        //define url
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
                print("Oops something has been result wrong \(err.localizedDescription)")
            }
            
            //get secure way data
            guard let datas = data else {return}
            guard let responses = response as? HTTPURLResponse else {return}
            
            //check response
            if responses.statusCode == 200 {
                //Attempt to serialize data
                do {
                    let posts = try JSONDecoder().decode([PostModel].self, from: datas)
                    //return data
                    handler(posts)
                } catch let err {
                    print("Oops error ==>\(err.localizedDescription)");
                }
            }
            
        }.resume()
    }
    
    func getPostDetails(handler: @escaping([PostDetailModel]) -> ()) {
        //define url path
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
                print("oops error ===>\(err.localizedDescription)")
            }
            
            //get secure way data
            guard let datas = data else {return}
            guard let responses = response as? HTTPURLResponse else {return}
            
            //Check response
            if responses.statusCode == 200 {
                do {
                    let details = try JSONDecoder().decode([PostDetailModel].self, from: datas)
                    handler(details)
                } catch let err {
                    print("Oops error ==> \(err.localizedDescription)")
                }
            }
        }.resume()
    }
}
