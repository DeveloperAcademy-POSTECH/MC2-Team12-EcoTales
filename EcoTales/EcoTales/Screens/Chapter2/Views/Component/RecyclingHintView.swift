//
//  RecyclingGameView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/16.
//

import SwiftUI

struct RecyclingHintView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 45)
                    .foregroundColor(Color.PopupStrokeBrown)
                    .frame(width: 555, height: 270)
                RoundedRectangle(cornerRadius: 42)
                    .foregroundColor(Color.HintFillWhite)
                    .frame(width: 545, height: 258)
            }
            .offset(y: 60)
            HStack(spacing: 0) {
                HintTabSelectedView()
                ForEach(0..<5) { tab in
                   HintTabBrownView()
                }
            }
            .offset(y: -250)
        }
    }
}

struct RecyclingHintView_Previews: PreviewProvider {
    static var previews: some View {
        RecyclingHintView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
