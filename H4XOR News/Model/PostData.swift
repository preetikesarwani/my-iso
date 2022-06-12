//
//  PostData.swift
//  H4XOR News
//
//  Created by Preeti Kesarwani on 6/8/22.
//  Copyright © 2022 Preeti Kesarwani. All rights reserved.
//

import Foundation
struct Result  : Decodable{
    let hits : [Post]
}


struct Post : Decodable, Identifiable {
    var id : String {
        return objectID
    }
    let objectID : String
    let points : Int
    let title : String
    let url : String?
}
