//
//  MapPopup.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/11.
//

import SwiftUI

struct MapPopup: View {
    @Binding var isStagePopup: Bool
    @State private var isPausePopup = false
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.4)
                .ignoresSafeArea()
            if isStagePopup {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.PopupFillBrown)
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
                    RoundedRectangle(cornerRadius: 50)
                        .strokeBorder(Color.PauseStrokeBrown, lineWidth: 5)
                    VStack {
                        HStack {
                            Text("인트로")
                                .font(.system(size: 20, weight: .heavy))
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(Color.PopupReplayYellow)
                                        .frame(width: 80, height: 30)
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
                            }, label: {
                                NoButton()
                            }) .buttonStyle(PlainButtonStyle())
                            Button(action: {
                                isPausePopup = true
                            }, label: {
                                YesButton()
                            })
                            .fullScreenCover(isPresented: $isPausePopup,
                                             content: { FindWrongGameView(isStagePopup: $isStagePopup) })
                        }
                    }
                }
                .frame(width: 350, height: 280)
            }
        }
    }
}

struct MapPopup_Previews: PreviewProvider {
    static var previews: some View {
        MapPopup(isStagePopup: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
