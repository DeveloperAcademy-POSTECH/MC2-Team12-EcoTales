//
//  IntroView.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

struct IntroView: View {
    @State private var introNumber = 1
    var body: some View {
        switch introNumber {
        case 1:
            IntroOneView(introNumber: self.$introNumber)
        case 2:
            IntroTwoView(introNumber: self.$introNumber)
        case 3:
            IntroThreeView(introNumber: self.$introNumber)
        case 4:
            IntroFourView(introNumber: self.$introNumber)
        default:
            MapBackground()
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
