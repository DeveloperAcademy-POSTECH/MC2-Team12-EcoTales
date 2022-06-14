//
//  SoundTestView.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/13.
//

import AVFoundation
import SwiftUI

struct SoundTestView: View {
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        ZStack {
            Text("Play Sound!")
        }
        .onAppear(perform: {
            playSounds("mixkit-player-jumping-in-a-video-game-2043.wav")
        })
    }
}

