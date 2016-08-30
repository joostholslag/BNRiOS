//
//  WebViewController.swift
//  Wordtrotter
//
//  Created by Joost Holslag on 03/03/16.
//  Copyright © 2016 Joost Holslag. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    
override func loadView() {
    webView = WKWebView()
    let urlRequest = NSURLRequest(URL:  NSURL(string: "https://www.bignerdranch.com")!)
    webView!.loadRequest(urlRequest)
    view = webView
        
}

    
override func viewDidLoad() {
        super.viewDidLoad()
        print("WebView did load")
        
    }
    
    
}


