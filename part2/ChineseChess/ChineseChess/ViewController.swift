//
//  ViewController.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/24.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var musicStateBtn: UIButton!
    
    @IBOutlet weak var startGameBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let isOn = UserDefaultManager.getAudioState()
        if isOn {
            musicStateBtn.setTitle("音效:开", for: UIControl.State.normal)
            MusicEngine.sharedInstance.palyBgMusic()
        }else{
            musicStateBtn.setTitle("音效:关", for: UIControl.State.normal)
            MusicEngine.sharedInstance.stopBgMusic()
        }
    }

    @IBAction func startGame(_ sender: Any) {
        let gameVc = GameViewController()
        gameVc.modalPresentationStyle = .overFullScreen
        self.present(gameVc, animated: true, completion: nil)
    }
    

    @IBAction func musicState(_ sender: Any) {
        let isOn = UserDefaultManager.getAudioState()
        if isOn {
            musicStateBtn.setTitle("音效:关", for: UIControl.State.normal)
            UserDefaultManager.setAudioState(isOn: false)
            MusicEngine.sharedInstance.stopBgMusic()
        }else{
            musicStateBtn.setTitle("音效:开", for: UIControl.State.normal)
            UserDefaultManager.setAudioState(isOn: true)
            MusicEngine.sharedInstance.palyBgMusic()
        }
    }
    deinit {
        MusicEngine.sharedInstance.stopBgMusic()
    }
}

