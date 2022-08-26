//
//  MusicEngine.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/24.
//

import UIKit
import AVFoundation

class MusicEngine: NSObject {
    var player: AVAudioPlayer?
    static let sharedInstance = MusicEngine()
    private override init() {
        //音频文件路径
        let path = Bundle.main.path(forResource: "bgMusic", ofType: ".mp3")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        player = try! AVAudioPlayer(data: data)
        //预加载
        player?.prepareToPlay()
        //无限循环
        player?.numberOfLoops = -1
    }
    
    func palyBgMusic() {
        if !player!.isPlaying {
            player?.play()
        }
    }
    func stopBgMusic() {
        if player!.isPlaying {
            player?.stop()
        }
    }
    
}
