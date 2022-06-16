//
//  SoundManager.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/14.
//

import AVFoundation

var audioPlayer: AVAudioPlayer!

struct SoundManager {
    static func playSounds(_ soundFileName: String) {
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.play()
    }
}
