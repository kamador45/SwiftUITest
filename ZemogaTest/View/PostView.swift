//
//  ContentView.swift
//  ZemogaTest
//
//  Created by Kevin Amador Rios on 6/1/22.
//

import SwiftUI

struct PostView: View {
    
    //Select by default all data
    @State private var selectedTab:sideData = .AllPosts
    @State var model = PostListViewModel()
    @State var detailModel = PostDetailListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Choose a Side", selection: $selectedTab) {
                    ForEach(sideData.allCases, id:\.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
                ChoosenPostView(selectedView: selectedTab)
                Spacer()
            }
            .navigationTitle("Posts")
            .toolbar {
                Button {
                    //Download again
                    model.getPost()
                } label: {
                    Image(systemName: "play.fill")
                }
            }
        }
    }
}

enum sideData:String, CaseIterable {
    case AllPosts = "All"
    case Fav = "Favorites"
}

struct ChoosenPostView:View {
    var selectedView: sideData
    var model: PostListViewModel = PostListViewModel()
    var detailModel = PostDetailListViewModel()
    
    var body: some View {
        switch selectedView {
        case .AllPosts:
            AllPost(model: model, detailModel: detailModel)
        case .Fav:
            FavPost(favPosts: "Fav")
        }
    }
}

struct AllPost: View {
    var model: PostListViewModel = PostListViewModel()
    var detailModel: PostDetailListViewModel = PostDetailListViewModel()
    
    
    var body: some View {
        List(model.posts) { post in
            NavigationLink(destination:DetailsPostView(detailModel: detailModel)) {
                HStack {
                    Text(post.title)
                        .font(.headline)
                }
            }
        }
    }
}

struct FavPost:View {
    var favPosts: String
    
    var body: some View {
        Text(favPosts)
            .fontWeight(.semibold)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
