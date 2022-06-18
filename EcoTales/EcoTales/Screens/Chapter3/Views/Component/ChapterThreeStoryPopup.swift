//
//  ChapterThreeStoryPopup.swift
//  EcoTales
//
//  Created by 임 용관 on 2022/06/16.
//

import SwiftUI

struct ChapterThreeStoryPopup: View {
    @Binding var isMapPopup: Bool
    @Binding var isStoryPopup: Bool
    @EnvironmentObject var chapterThreeUserValue: ChapterThreeUserSettings
    var body: some View {
        ZStack {
            if isStoryPopup {
                Color.black
                    .opacity(0.4)
                Group {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.PopupFillBrown)
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
                    RoundedRectangle(cornerRadius: 50)
                        .strokeBorder(Color.PauseStrokeBrown, lineWidth: 5)
                }
                .frame(width: 300, height: 280)
                VStack(alignment: .center, spacing: 25) {
                    Button(action: {
                        // Dismiss the Popup
                        isStoryPopup = false
                    }, label: {
                        ContinueButton()
                    })
                    Button(action: {
                        chapterThreeUserValue.lifeCount = 3
                        isStoryPopup = false
                        for index in 0...4 {
                            chapterThreeUserValue.isShowCircle[index] = false
                        }
                    }, label: {
                        ReplayButton()
                    })
                    Button(action: {
                        isMapPopup = false
                    }, label: {
                        ExitButton()
                    })
                }
            }
        }
    }
}

struct ChapterThreeStoryPopup_Previews: PreviewProvider {
    static var previews: some View {
        ChapterThreeStoryPopup(isMapPopup: .constant(true), isStoryPopup: .constant(true))
    }
}
