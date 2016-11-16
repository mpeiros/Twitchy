//
//  ChannelViewController.swift
//  Twitchy
//
//  Created by Max Peiros on 11/14/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import UIKit
import WebKit

class ChannelViewController: UIViewController {
    
    var stream: Stream!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.frame)
        view.addSubview(webView)
        
        let urlString = TWITCH_URL_EMBED_BASE + stream.broadcasterName + TWITCH_URL_EMBED
        
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}
