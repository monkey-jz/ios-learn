//
//  UserDefaultManager.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/24.
//

import UIKit

class UserDefaultManager: NSObject {
    
    static let audioKey = "audioKey"
    
    class func setAudioState(isOn: Bool){
        if isOn {
            UserDefaults.standard.set("on", forKey: audioKey)
        }else{
            UserDefaults.standard.set("off", forKey: audioKey)
        }
        UserDefaults.standard.synchronize()
        
    }
    
    class func getAudioState() -> Bool {
        let state = UserDefaults.standard.string(forKey: audioKey)
        if let on = state {
            if on == "on"  {
                return true
            }else{
                return false
            }
        }
        return false
    }

}
