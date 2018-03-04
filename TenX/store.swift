//
//  store.swift
//  TenX
//
//  Created by BDabrowski on 3/19/17.
//  Copyright © 2017 Broski Studios. All rights reserved.
//


import Foundation
import WebKit

class Store: UIViewController, WKNavigationDelegate {
    
    var webView : WKWebView!
    var progBar = UIProgressView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let site = "https://grantcardone.com/products"
        let url = URL(string: site)
        let request = NSURLRequest(url: url!)
        
        
        webView = WKWebView(frame: CGRect(x: 0, y: 45, width: view.frame.width, height: view.frame.height))
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        self.view.addSubview(webView)
        self.view.sendSubview(toBack: webView)
        
        progBar = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        progBar.progress = 0.0
        progBar.tintColor = UIColor.red
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        webView.addSubview(progBar)
        
        view.addSubview(webView)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            self.progBar.alpha = 1.0
            progBar.setProgress(Float(webView.estimatedProgress), animated: true)
            
            if self.webView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: UIViewAnimationOptions.curveEaseInOut,
                               animations:
                    {
                        () -> Void in self.progBar.alpha = 0.0
                },
                               completion:
                    {
                        (finished:Bool) -> Void in self.progBar.progress = 0
                })
            }
        }
    }
    
    @IBAction func goForward(_ sender: Any) {
        webView.goForward()
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        webView.goBack()
    }

    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
    
    
    /*override func viewWillDisappear(_ animated: Bool) {
     webView.removeObserver(self, forKeyPath: "estimatedProgess")
     }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
