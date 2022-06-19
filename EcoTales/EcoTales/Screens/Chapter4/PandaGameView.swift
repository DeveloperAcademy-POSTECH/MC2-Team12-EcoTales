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
            Image(ImageLiteral.pandaBackground)
                .resizable()
                .ignoresSafeArea()
                .onTapGesture(  perform: {
                    SoundManager.playSounds(SoundLiteral.SoundForWrong)
                })
            VStack {
                ZStack {
                    HStack {
                        Button {
                            self.isShowingPopup = true
                            } label: {}
                            .buttonStyle(PauseButtonStyle())
                        Spacer()
                    }
                    .padding(.top, 5)
                    .padding(.leading, 10)
                    HStack {
                        Image(ImageLiteral.childHead)
                            .scaledToFit()
                            .frame(alignment: .center)
                            .padding(.top, 5)
                        Image(ImageLiteral.turtleDialog)
                            .scaledToFit()
                            .frame(alignment: .center)
                            .overlay(Text("치료약을 만들기 위해 레서판다 미뉴를 찾아보자!"))
                            .opacity(showGameClear ? 0 : 1)
                    }
                }
                Spacer()
            }

            Group {
                Button {
                    showGameClear.toggle()
                } label: {
                    Image(ImageLiteral.meenuDoctor)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                .position(x: 520, y: 110)
            }

            if showGameClear {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                Image(ImageLiteral.gameClear)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .onAppear(perform: {
                        SoundManager.playSounds(SoundLiteral.SoundForRight)
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
