//
//  WebViewController.swift
//  baseTest
//
//  Created by macmini on 2017/9/25.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate{
    let webView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
    }
    
    //根据返回结果判断是否跳转新页面
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
