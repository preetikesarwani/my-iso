//
//  DetailsViews.swift
//  H4XOR News
//
//  Created by Preeti Kesarwani on 6/8/22.
//  Copyright © 2022 Preeti Kesarwani. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailsViews: View {
    
    let url : String?
    
    var body: some View {
        WebView(urlString: url )
    }
}

struct DetailsViews_Previews: PreviewProvider {
    static var previews: some View {
        DetailsViews(url: "https://www.google.com")
    }
}

struct WebView : UIViewRepresentable {
    
    let urlString : String?
    
   func makeUIView(context: Context) -> WKWebView {
       return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}


