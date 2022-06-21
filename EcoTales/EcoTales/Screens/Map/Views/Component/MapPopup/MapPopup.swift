//
//  MapPopup.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/11.
//

import SwiftUI

struct MapPopup: View {
    @EnvironmentObject var chapterProgress: ChapterProgress
    @Binding var isStagePopup: Bool
    @Binding var isIntroShow: Bool
    @Binding var isGameStoryShow: Bool

    var chapter: Chapter = .zero

    var body: some View {
        ZStack {
            if isStagePopup {
                Dim()
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.PopupFillBrown)
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
                    RoundedRectangle(cornerRadius: 50)
                        .strokeBorder(Color.PauseStrokeBrown, lineWidth: 5)
                    VStack {
                        HStack {
                            Text(chapter.name())
                                .font(.system(size: 20, weight: .heavy))
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(Color.PopupReplayYellow)
                                        .frame(width: 120, height: 30)
                                )
                                .padding(.leading, 60)
                            Spacer()
                        }
                        Text("이야기를 시작할까요?")
                            .font(.system(size: 24, weight: .heavy))
                            .frame(width: 350, height: 90, alignment: .center)
                        HStack(alignment: .center, spacing: 25) {
                            Button(action: {
                                // Dismiss the PopUp
                                isStagePopup = false
                                withAnimation(.linear(duration: 0.3)) {
                                    if chapter == .zero {
                                        isIntroShow = true
                                    } else {
                                        isGameStoryShow = true
                                    }
                                }
                            }, label: {
                                YesButton()
                            })
                            Button(action: {
                                // Dismiss the PopUp
                                withAnimation(.linear(duration: 0.3)) {
                                    isGameStoryShow = false
                                    isStagePopup = false
                                }
                            }, label: {
                                NoButton()
                            })
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .frame(width: 350, height: 280)
            }
        }
    }
}
