//
//  PandaGameView.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/16.
//
import AVFoundation
import SwiftUI

struct PandaGameView: View {
    @EnvironmentObject var chapterProgress: ChapterProgress
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isStagePopup: Bool
    @Binding var isGameClear: Bool
    @State private var isPausePopup = false
    @State private var showGameClear = false

    var body: some View {
        ZStack {
            Image(ImageLiteral.pandaBackground)
                .resizable()
                .ignoresSafeArea()
                .onTapGesture(perform: {
                    SoundManager.playSounds(SoundLiteral.soundForWrong)
                })
            VStack {
                ZStack {
                    HStack {
                        Button {
                            self.isPausePopup = true
                            } label: {}
                            .buttonStyle(PauseButtonStyle())
                            // TODO: 아예 PauseButton이나 PauseButtonLabel을 만드는 게 좋을 것 같다는 생각이 들었습니다. 추후에 수정이 가능하다면 수정합니다.
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
                    Image(ImageLiteral.meenu)
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
                        SoundManager.playSounds(SoundLiteral.soundForRight)
                    })
                    .onTapGesture(perform: {
                        isGameClear = true
                        presentationMode.wrappedValue.dismiss()
                        chapterProgress.completionStatus[.four] = true
                    })
            }

            if isPausePopup {
                StoryPopup(isStagePopup: $isStagePopup, isPausePopup: $isPausePopup)
                    .ignoresSafeArea()
            }
        }
        .navigationBarHidden(true)
    }
}
