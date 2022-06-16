//
//  Chapter3_MapPopup.swift
//  EcoTales
//
//  Created by 임 용관 on 2022/06/16.
//

import SwiftUI

struct Chapter3StoryPopup: View {
    @Binding var isMapPopup: Bool
    @Binding var isStoryPopup: Bool
    @EnvironmentObject var chapter3UserValue: Chapter3UserSettings
    var body: some View {
        ZStack {
            if isStoryPopup {
                Color.black
                    .opacity(0.4)
                ZStack(alignment: .center) {
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
                        chapter3UserValue.lifeCounter = 3
                        isStoryPopup = false
                        for index in 0...4 {
                            chapter3UserValue.isShowCircle[index] = false
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

struct Chapter3StoryPopup_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3StoryPopup(isMapPopup: .constant(true), isStoryPopup: .constant(true))
    }
}
