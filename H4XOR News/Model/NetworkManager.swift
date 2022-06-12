//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Preeti Kesarwani on 6/8/22.
//  Copyright © 2022 Preeti Kesarwani. All rights reserved.
//

import Foundation

class NetworkManager : ObservableObject {
    
     @Published var posts = [Post]()
    
    func fetchData() {
        if  let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                          let result =  try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits

                            }
                           } catch {
                            print(error)
                        }
                     
                    }
                    
                    
                }
            }
            
            task.resume()
        }
        
    }
    
}
