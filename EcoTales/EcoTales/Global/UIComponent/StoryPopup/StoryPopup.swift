//
//  StoryPopup.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//
import SwiftUI

struct StoryPopup: View {
    //    @State private var showPopUp = false
    @Binding var iscount: Bool
    @State var isShowSheet = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            if iscount {
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
                            iscount = false
                        }
                    }, label: {
                        ContinueButton()
                    })
                    Button(action: {
                        withAnimation(.linear(duration: 0.3)) {
                            isShowSheet = true
                        }
                    }, label: {
                        ReplayButton()
                    })
                    .fullScreenCover(isPresented: $isShowSheet, content: { HiddenObjGameView() })
                    Button(action: {
                        // Dismiss the Present View
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        ExitButton()
                    }).buttonStyle(PlainButtonStyle())
                }
            }
        }
        .position(x: (UIScreen.main.bounds.maxX / 2) - 30, y: UIScreen.main.bounds.maxY / 2)
    }
}

struct StoryPopup_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryPopup(iscount: .constant(true))
        }
    }
}
