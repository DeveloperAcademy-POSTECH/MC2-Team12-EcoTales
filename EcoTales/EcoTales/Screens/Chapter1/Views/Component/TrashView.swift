//
//  TrashView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/12.
//

import SwiftUI

struct TrashView: View {
    @State private var isFound = false
    @State private var foundObjectImage = "hidden_can"
    @State private var foundObjectPosition: CGPoint = .zero
    @State private var foundObjectRotation: Int = 0
    @State private var isFoundShown = true
    var trash: HiddenObject
    @Binding var foundTrash: Set<String>

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
                        foundObjectImage = trash.image
                        foundObjectPosition = CGPoint(x: trash.positionX, y: trash.positionY)
                        foundObjectRotation = trash.rotation
                        withAnimation(Animation.easeInOut(duration: 0.5).delay(0.8)) {
                            foundTrash.insert(trash.image)
                        }
                    }
                if isFound {
                    ZStack(alignment: .center) {
                        Circle()
                            .fill(Color.PopupStrokeBrown)
                            .frame(width: 65, height: 65)
                        Circle()
                            .fill(.orange)
                            .frame(width: 59, height: 59)
                        Image(foundObjectImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(Double(foundObjectRotation)))
                    }
                    .shadow(radius: 3, x: 3, y: 3)
                    .position(foundObjectPosition)
                    .onAppear(perform: {
                        withAnimation(Animation.easeInOut(duration: 0.5).delay(0.8)) {
                            isFound.toggle()
                            isFoundShown.toggle()
                        }
                    })
                }
            }
        }
    }
}
