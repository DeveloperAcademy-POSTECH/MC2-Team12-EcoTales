//
//  StoryPopup.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//
import SwiftUI

struct StoryPopup: View {
    @Binding var isShowingPopup: Bool
    @State var isGameStoryShow = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            if isShowingPopup {
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
                        withAnimation(.linear(duration: 0.3)) {
                            isShowingPopup = false
                        }
                    }, label: {
                        ContinueButton()
                    })
                    // TODO : 맵쪽에서 만들 기능. merge 후에 초기화 기능으로 바꿔야 함.
                    Button(action: {
                        withAnimation(.linear(duration: 0.3)) {
                            isGameStoryShow = true
                        }
                    }, label: {
                        ReplayButton()
                    })
                    .fullScreenCover(isPresented: $isGameStoryShow, content: { HiddenObjGameView() })
                    Button(action: {
                        // Dismiss the Present View
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        ExitButton()
                    }).buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct StoryPopup_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryPopup(isShowingPopup: .constant(true))
        }
    }
}
