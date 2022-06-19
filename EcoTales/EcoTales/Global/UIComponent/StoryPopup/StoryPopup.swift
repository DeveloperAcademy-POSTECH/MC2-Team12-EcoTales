//
//  StoryPopup.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//
import SwiftUI

struct StoryPopup: View {
    @Binding var isStagePopup: Bool
    @Binding var isPausePopup: Bool
    var body: some View {
        ZStack {
<<<<<<< HEAD
            if isShowingPopup {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                ZStack(alignment: .center) {
=======
            if isPausePopup {
                Dim()
                Group {
>>>>>>> main
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
                        isPausePopup = false
                    }, label: {
                        ContinueButton()
                    })
                    Button(action: {
                    }, label: {
                        ReplayButton()
                    })
<<<<<<< HEAD
//                    .fullScreenCover(isPresented: $isGameStoryShow, content: { HiddenObjGameView() })
=======
>>>>>>> main
                    Button(action: {
                        isStagePopup = false
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
<<<<<<< HEAD
            StoryPopup(isShowingPopup: .constant(true))
                .previewInterfaceOrientation(.landscapeLeft)
=======
            StoryPopup(isStagePopup: .constant(true), isPausePopup: .constant(true))
>>>>>>> main
        }
    }
}
