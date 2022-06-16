//
//  PandaGameView.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/16.
//
import AVFoundation
import SwiftUI

struct PandaGameView: View {

    @State private var showGameClear = false
    @State private var isShowingPopup = false
    @State var audioPlayer: AVAudioPlayer!

    var body: some View {
        ZStack {
            Image("chapterFour-gameBackground")
                .resizable()
                .ignoresSafeArea()
                .onTapGesture(  perform: {
                    SoundManager.playSounds("mixkit-player-jumping-in-a-video-game-2043.wav")
                })

            VStack {
                HStack {
                    Button(action: {
                        self.isShowingPopup = true
                    }, label: {})
                    .buttonStyle(PauseButtonStyle())
                    Image("chapter4_mainCharacterHeadCircle")
                        .scaledToFit()
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 10)
                Spacer()
            }

            Group {
                Button(action: {
                    showGameClear.toggle()
                })
                {
                    Image("character_meenuDoctor")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                .position(x: 520, y: 110)
            }

            if showGameClear {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                Image("gameClear")
                    .onAppear(perform: {
                        SoundManager.playSounds("correctAnswer.mp3")
                    })
                    .onTapGesture(  perform: {
                        // todo: go to next view
                    })
            }

            if isShowingPopup {
                StoryPopup(isShowingPopup: $isShowingPopup)
                    .ignoresSafeArea()
            }
        }
    }
}

struct PandaGameView_Previews: PreviewProvider {
    static var previews: some View {
        PandaGameView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
