//
//  PlaySound.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/14.
//  https://www.hackingwithswift.com/forums/swiftui/playing-sound/4921

import AVFoundation

var audioPlayer: AVAudioPlayer!

func playSounds(_ soundFileName : String) {
    guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
        fatalError("Unable to find \(soundFileName) in bundle")
    }

    do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
    } catch {
        print(error.localizedDescription)
    }
    audioPlayer.play()
}
