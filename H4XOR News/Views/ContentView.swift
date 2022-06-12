//
//  ContentView.swift
//  H4XOR News
//
//  Created by Preeti Kesarwani on 6/8/22.
//  Copyright © 2022 Preeti Kesarwani. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailsViews(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
            }
                
            .navigationBarTitle("H4XOR News")
        }
            
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//let posts = [
//  Post(id: "1", title: "Hello"),
//Post(id: "2", title: "Hola"),
//Post(id: "3", title: "Hi")
//]
