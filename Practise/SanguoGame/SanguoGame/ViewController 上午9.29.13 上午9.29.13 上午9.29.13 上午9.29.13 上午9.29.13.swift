//
//  ViewController.swift
//  SanguoGame
//
//  Created by Rocky on 2018/6/25.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = UIWebView(frame: view.frame)
        webView.allowsInlineMediaPlayback = true
        webView.allowsLinkPreview = true
        webView.allowsPictureInPictureMediaPlayback = true
        let url = URL(string: "http://192.168.0.152")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
        let wk = WKWebView(frame: view.frame)
        wk.allowsLinkPreview = true
        wk.allowsBackForwardNavigationGestures = true
        wk.load(request)
        
        self.view.addSubview(wk)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

