//
//  TrashView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/12.
//

import SwiftUI

struct TrashView: View {
    @State private var isFound = false
    @State private var foundObject = "none"
    @State private var foundObjectPosition: CGPoint = .zero
    @State private var foundObjectRotation: Int = 0
    @State private var isFoundShown = true
    var trash: HiddenObject

    var body: some View {
        if isFoundShown {
            ZStack {
                Image(trash.image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .opacity(trash.opacity)
                    .rotationEffect(.degrees(Double(trash.rotation)))
                    .position(CGPoint(x: trash.positionX, y: trash.positionY))
                    .onTapGesture {
                        isFound.toggle()
                        foundObject = trash.image
                        foundObjectPosition = CGPoint(x: trash.positionX, y: trash.positionY)
                        foundObjectRotation = trash.rotation
                    }
                if isFound {
                    ZStack(alignment: .center) {
                        Circle()
                            .fill(Color.PopupStrokeBrown)
                            .frame(width: 65, height: 65)
                        Circle()
                            .fill(.orange)
                            .frame(width: 59, height: 59)
                        Image(foundObject)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(Double(foundObjectRotation)))
                    }
                    .shadow(radius: 3, x: 3, y: 3)
                    .position(foundObjectPosition)
                    .onAppear(perform: {
                        withAnimation(Animation.easeInOut(duration: 1.0).delay(1.0)) {
                            isFound.toggle()
                            isFoundShown.toggle()
                        }
                    })
                }
            }
        }
    }
}
