//
//  StoryPopup.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//
import SwiftUI

struct StoryPopup: View {
    @Binding var isMapPopup: Bool
    @Binding var isStoryPopup: Bool
    var body: some View {
        ZStack {
            if isStoryPopup {
                Color.black
                    .opacity(0.4)
                Group {
//                ZStack(alignment: .center) {
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

struct StoryPopup_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryPopup(isMapPopup: .constant(true), isStoryPopup: .constant(true))
        }
    }
}
