//
//  StoryPopup.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//

import SwiftUI

struct StoryPopup: View {
    @State private var showPopUp = false
    var body: some View {
        ZStack{
            ZStack{
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.PopupFillBrown)
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
                RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(Color.PauseStrokeBrown, lineWidth: 5)
            }
            .frame(width: 300, height: 280)
            
            VStack(alignment: .center, spacing: 25){
                ContinueButton()
                ReplayButton()
                ExitButton()
            }
        }
    }
}

struct StoryPopup_Previews: PreviewProvider {
    static var previews: some View {
        StoryPopup()
    }
}
