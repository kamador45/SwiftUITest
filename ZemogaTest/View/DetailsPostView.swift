//
//  DetailsPost.swift
//  ZemogaTest
//
//  Created by Kevin Amador Rios on 6/1/22.
//

import SwiftUI

struct DetailsPostView: View {
    
    var detailModel: PostDetailListViewModel = PostDetailListViewModel()
    
    var body: some View {
        NavigationView {
            List (detailModel.details) { details in
                Section(header: Text("Description")) {
                    Text(details.body)
                }.headerProminence(.increased)
                Section(header: Text("User")) {
                    Text("User info")
                }.headerProminence(.increased)
                Section(header: Text("Comments")) {
                    Text("Comments")
                }.headerProminence(.increased)
            }.listStyle(.insetGrouped)
        }
        .navigationTitle("Descriptions")
        .navigationBarTitleDisplayMode(.inline)
        Spacer()
    }
}

struct DetailsPost_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPostView()
    }
}
