//
//  SoundManager.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/14.
//

import AVFoundation

struct SoundManager {
    static var audioPlayer: AVAudioPlayer!
    static func playSounds(_ soundFileName: String) {
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error.localizedDescription)
        }
        self.audioPlayer.play()
    }
}
