//
//  WebView.swift
//  Party
//
//  Created by Danny Nuch on 11/21/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import WebKit

class WebView: BaseView, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func setUpViews() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: UIScreen.main.bounds, configuration: webConfiguration)
        webView.navigationDelegate = self
    }
    
    func loadWebView(website: String) {
        print(website)
        if let url = URL(string: website) {
            webView.load(URLRequest(url: url))
        }
    }
}
