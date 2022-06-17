//
//  HintTabSelected.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/17.
//

import SwiftUI

struct HintTabSelectedView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.PopupStrokeBrown)
                .frame(width: 77, height: 55)
            RoundedRectangle(cornerRadius: 11)
                .foregroundColor(Color.HintFillWhite)
                .frame(width: 67, height: 45)
        }
        .mask(Rectangle().padding(.bottom, 17))
    }
}

struct HintTabSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        HintTabSelectedView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
