//
//  HintTabBrownView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/17.
//

import SwiftUI

struct HintTabBrownView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 11)
                .foregroundColor(Color.HintBehindBrown)
                .frame(width: 77, height: 55)
                .mask(Rectangle().padding(.bottom, 17))
            Rectangle()
                .foregroundColor(Color.PopupStrokeBrown)
                .frame(width: 77, height: 5)
                .offset(y: 8)
        }
    }
}

struct HintTabBrownView_Previews: PreviewProvider {
    static var previews: some View {
        HintTabBrownView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
