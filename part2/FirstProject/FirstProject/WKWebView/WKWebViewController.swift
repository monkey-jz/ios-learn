//
//  WKWebViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/9.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController,WKScriptMessageHandler,WKUIDelegate {
    var wkWebView: WKWebView!
    var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfig = WKWebViewConfiguration()
        let pool = WKProcessPool()
        webConfig.processPool = pool
        let wkPre = WKPreferences()
        wkPre.minimumFontSize = 10
        wkPre.javaScriptEnabled = true
        wkPre.javaScriptCanOpenWindowsAutomatically = true
        webConfig.preferences = wkPre
        let wkUserController = WKUserContentController()
        wkUserController.add(self, name: "nativeFunc")
//        let data = ["面壁者": "希恩斯"]
//        let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
//        let jsonText = String.init(data: jsonData!, encoding: String.Encoding.utf8)

        let jstring = "function userFunc() {window.webkit.messageHandlers.nativeFunc.postMessage({\"123\": \"希恩斯\"}) }; userFunc()"
       
        let script = WKUserScript(source: jstring, injectionTime: WKUserScriptInjectionTime.atDocumentStart, forMainFrameOnly: false)
        wkUserController.addUserScript(script)
        webConfig.userContentController = wkUserController
        self.wkWebView = WKWebView(frame: self.view.frame, configuration: webConfig)
        let url = URL(string: "http://www.baidu.com")
        let request = URLRequest(url: url!)
        self.wkWebView.load(request)
        self.progressView = UIProgressView(frame: CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: 30))
        self.progressView.progressTintColor = UIColor.cyan
    
        self.progressView.progress = 0
      
        self.view.addSubview(self.wkWebView!)
        self.view.addSubview( self.progressView)
        self.wkWebView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context:nil)

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("=====observeValue====")
        if keyPath == "estimatedProgress" {
            self.progressView.progress = Float(self.wkWebView!.estimatedProgress)
            if self.wkWebView.estimatedProgress >= 1.0 {
                self.progressView.progress = 0
                self.progressView.isHidden = true
                self.wkWebView.removeObserver(self, forKeyPath: "estimatedProgress", context:nil)
            }
         
        }
    }
    

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
        print("====userContentController==")
        print(message.body,message.name)
            self.wkWebView.evaluateJavaScript("function jsFunc(){console.log(\"js===\")}; jsFunc()",completionHandler:{(Any,Error) in
                    print(Error.debugDescription)
       })
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        print("====webViewDidClose==")
    }

    func webView(_ webView: WKWebView, contextMenuDidEndForElement elementInfo: WKContextMenuElementInfo) {
        print("====contextMenuDidEndForElement==")
    }
    func webView(_ webView: WKWebView, contextMenuWillPresentForElement elementInfo: WKContextMenuElementInfo) {
        print("====contextMenuWillPresentForElement==")
    }
    func webView(_ webView: WKWebView, contextMenuForElement elementInfo: WKContextMenuElementInfo, willCommitWithAnimator animator: UIContextMenuInteractionCommitAnimating) {
        print("====contextMenuForElement==")
    }
    func webView(_ webView: WKWebView, contextMenuConfigurationForElement elementInfo: WKContextMenuElementInfo, completionHandler: @escaping (UIContextMenuConfiguration?) -> Void) {
        print("====contextMenuConfigurationForElement==")
    }
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print("====runJavaScriptAlertPanelWithMessage==")
    }
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        print("====runJavaScriptConfirmPanelWithMessage==")
    }
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//
//    }
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        print("====runJavaScriptTextInputPanelWithPrompt==")
    }
    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
        print("====commitPreviewingViewController==")
    }
    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
        return true
        print("====shouldPreviewElement==")
    }
//    func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKPreviewElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
//
//    }
//    override func allowedChildrenForUnwinding(from source: UIStoryboardUnwindSegueSource) -> [UIViewController] {
//
//    }
    
//



}
