//
//  ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/9.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate{
    let bottomViewHeight = 50
    let btnWidth = 60
    var webView: UIWebView?
    var leftBtn: UIButton!
    var rightBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = UIWebView(frame: self.view.bounds)
        let url = URL(string: "http://www.baidu.com")
        let request = URLRequest(url: url!)
        self.webView!.loadRequest(request)
        self.view.addSubview(self.webView!)
        self.view.addSubview(getBottomView())
        
    }
    func getBottomView() -> UIView{
        let bottomView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height - CGFloat(bottomViewHeight), width: self.view.frame.size.width, height: CGFloat(bottomViewHeight)))
        bottomView.backgroundColor = UIColor.cyan
        self.leftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: btnWidth, height: bottomViewHeight))
        self.leftBtn.setTitle("后退", for: .normal)
        self.leftBtn.backgroundColor = UIColor.red
        self.leftBtn.setTitleColor(UIColor.white, for: .normal)
        self.leftBtn.setTitleColor(UIColor.gray, for: .disabled)
        self.leftBtn.addTarget(self, action: #selector(onLeftBtnClick(btn:)), for: .touchUpInside)
        bottomView.addSubview(self.leftBtn)
        self.rightBtn = UIButton(frame: CGRect(x: self.view.frame.size.width - CGFloat(btnWidth), y: 0, width: CGFloat(btnWidth), height: CGFloat(bottomViewHeight)))
        self.rightBtn.setTitle("前进", for: .normal)
        self.rightBtn.backgroundColor = UIColor.red
        self.rightBtn.setTitleColor(UIColor.white, for: .normal)
        self.rightBtn.setTitleColor(UIColor.gray, for: .disabled)
        self.rightBtn.addTarget(self, action: #selector(onRightBtnClick(btn:)), for: .touchUpInside)
        bottomView.addSubview(self.rightBtn)
        return bottomView
    }
    @objc
    func onLeftBtnClick(btn: UIButton){
        print("left ===")
        webView?.goBack()
    }
    @objc
    func onRightBtnClick(btn: UIButton){
        print("right ===")
        webView?.goForward()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webViewDidFinishLoad: canGoForward \(webView.canGoForward),canGoBack \(webView.canGoBack)")
        self.rightBtn.isEnabled = webView.canGoForward
        self.leftBtn.isEnabled = webView.canGoBack
        
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("webViewDidStartLoad")
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("didFailLoadWithError")
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print("shouldStartLoadWith")
        return true
    }
    


}

