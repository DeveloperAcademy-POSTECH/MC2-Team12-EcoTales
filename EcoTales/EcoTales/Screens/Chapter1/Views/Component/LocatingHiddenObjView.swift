//
//  LocatingHiddenObjView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/11.
//

import SwiftUI

struct LocatingHiddenObjView: View {
    var body: some View {
        ZStack {
            ForEach(hiddenObject, id: \.self) { trash in
                Button(action: {
                  // action
                }, label: {
                    Image(trash.image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .opacity(trash.opacity)
                        .rotationEffect(.degrees(Double(trash.rotation)))
                        .position(CGPoint(x: trash.positionX, y: trash.positionY))
                })
            }
        }
    }
}
