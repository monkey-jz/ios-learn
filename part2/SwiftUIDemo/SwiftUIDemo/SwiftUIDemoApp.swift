//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by boyaa on 2022/8/17.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(EnviData())
        }
    }
}
