//
//  WebViewController.swift
//  Headlines
//
//  Created by Md Ashfaqur Rahman on 16/11/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var weburl = ""
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: weburl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }

}

