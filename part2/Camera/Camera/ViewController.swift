//
//  ViewController.swift
//  Camera
//
//  Created by boyaa on 2022/9/22.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var takePictureButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var avPlayerViewController: AVPlayerViewController!
    var image: UIImage?
    var movieURL: URL?
    var lastChosenMediaType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            takePictureButton.isHidden = true
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear ====")
        updateDisplay()
    }
    
   
    @IBAction func selectImage(_ sender: UIButton) {
        pickMediaFromSource(sourceType: .photoLibrary)
    }
    
    @IBAction func takePhotoOrVideo(_ sender: UIButton) {
        pickMediaFromSource(sourceType: .camera)
    }
    
    func updateDisplay() {
        if let mediaType = lastChosenMediaType {
            print("updateDisplay 111 ====")
            if mediaType == (kUTTypeImage as NSString) as String {
                print("updateDisplay 222 ====")
                imageView.image = image!
                imageView.isHidden = false
                if avPlayerViewController != nil {
                    avPlayerViewController.view.isHidden = true
                }
            }else if mediaType == (kUTTypeMovie as NSString) as String {
                imageView.isHidden = true
                avPlayerViewController.player = AVPlayer(url: movieURL!)
                avPlayerViewController.view.isHidden = false
                avPlayerViewController.player?.play()
            
            }
        }
    }
    
    func setAVplayerLayoutConstraints() {
        let avPlayerView = avPlayerViewController.view
        avPlayerView?.translatesAutoresizingMaskIntoConstraints = false
        avPlayerView?.frame = imageView.frame
    }
    
    func pickMediaFromSource(sourceType: UIImagePickerController.SourceType) {
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType)
        if UIImagePickerController.isSourceTypeAvailable(sourceType) && mediaTypes!.count > 0 {
            let picker = UIImagePickerController()
            picker.mediaTypes = mediaTypes!
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            
            present(picker, animated: true, completion: {() in
                print("pickMediaFromSource: completion ===")
                
            })
            
        }else {
            let alertController = UIAlertController(title: "错误的媒体类型", message: "不支持此类媒体类型", preferredStyle: .alert)
            let action = UIAlertAction(title: "知道了", style: .cancel, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
     }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        lastChosenMediaType = info[UIImagePickerController.InfoKey.mediaType] as? String
        if let mediaType = lastChosenMediaType {
            if mediaType == (kUTTypeImage as NSString) as String{
                image = info[.editedImage] as! UIImage
            }else if mediaType == (kUTTypeMovie as NSString) as String {
                movieURL = info[.mediaURL] as! URL
            }
            picker.dismiss(animated: true, completion: nil)
                        
        }
        updateDisplay()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

