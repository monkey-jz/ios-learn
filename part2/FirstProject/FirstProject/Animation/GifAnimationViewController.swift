//
//  GifAnimationViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/11.
//

import UIKit
import ImageIO

class GifAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        pilayGifOnWebView(name: "lufei")
        playGifImage(name: "lufei")
    }
    
    func playGifImage(name: String) {
        let imageView = UIImageView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        self.view.addSubview(imageView)
        let path = Bundle.main.path(forResource: name, ofType: "gif")
       
        let url = URL.init(fileURLWithPath: path!)
        let source = CGImageSourceCreateWithURL(url as CFURL, nil)
      
        let count = CGImageSourceGetCount(source!)
        print("count: \(count)")
        var imageArray = Array<UIImage>()
        var imagesWidth = Array<Int>()
        var imagesHeight = Array<Int>()
        var time: Int = Int()
        for index in 0..<count {
            let image = CGImageSourceCreateImageAtIndex(source!, index, nil)
            
            imageArray.append(UIImage(cgImage: image!))
            let info = CGImageSourceCopyPropertiesAtIndex(source!, index, nil) as! Dictionary<String,AnyObject>
            let width = Int(info[kCGImagePropertyPixelWidth as! String] as! NSNumber)
            let height = Int(info[kCGImagePropertyPixelHeight as! String] as! NSNumber)
            imagesWidth.append(width)
            imagesHeight.append(height)
            let timeDic = info[kCGImagePropertyGIFDictionary as String] as! Dictionary<String,AnyObject>
            time += Int(timeDic[kCGImagePropertyGIFDelayTime as String] as! NSNumber)
         
        }
        imageView.frame = CGRect(x: 100, y: 100, width: imagesWidth[0], height: imagesHeight[0])
        imageView.animationImages = imageArray
        imageView.animationDuration = 0.2
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
   }
    
    func pilayGifOnWebView(name: String) {
        let webView = UIWebView(frame: CGRect(x: 20, y: 410, width: 150, height: 150))
        self.view.addSubview(webView)
        webView.scrollView.bounces = false
        webView.backgroundColor = UIColor.clear
        webView.scalesPageToFit = true
        let path = Bundle.main.path(forResource: name, ofType: "gif")
        let url = URL.init(fileURLWithPath: path!)
        let imageData = try! Data(contentsOf: url)
        webView.load(imageData, mimeType: "image/gif", textEncodingName: "", baseURL: URL(string: Bundle.main.bundlePath)!)
  }


}
