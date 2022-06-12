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
    var body: some View {
        ZStack {
            if iscount {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.PopupFillBrown)
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
                    RoundedRectangle(cornerRadius: 50)
                        .strokeBorder(Color.PauseStrokeBrown, lineWidth: 5)
                }
                .frame(width: 300, height: 280)
                VStack(alignment: .center, spacing: 25) {
                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            iscount = false
                        }
                    }, label: {
                        ContinueButton()
                    }).buttonStyle(PlainButtonStyle())
                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            iscount = false
                        }
                    }, label: {
                        ReplayButton()
                    })// .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            iscount = false
                        }
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
        StoryPopup(iscount: .constant(true))
    }
}
