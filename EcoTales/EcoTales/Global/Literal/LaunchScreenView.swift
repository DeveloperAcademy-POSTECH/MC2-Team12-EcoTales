//
//  LaunchScreenView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/09.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        HiddenObjGameView(isStagePopup: .constant(false))
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
