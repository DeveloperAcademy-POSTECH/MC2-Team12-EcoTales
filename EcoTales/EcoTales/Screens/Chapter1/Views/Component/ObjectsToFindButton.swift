//
//  ObjectsToFindButton.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/12.
//
//
import SwiftUI

struct ObjectsToFindButton: View {
    @State private var isShowingObjectName = false
    @State private var selectedObject = "none"
    var trash: HiddenObject

    var body: some View {
        Button(action: {
            withAnimation { isShowingObjectName.toggle() }
            selectedObject = trash.objectName
        }, label: {
            Image(trash.image)
                .frame(maxWidth: .infinity)
        })
        .overlay(
            ZStack(alignment: .center) {
                Text(selectedObject)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
            }
            .padding(.all, 10)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3, x: 3, y: 3)
            .offset(x: 0, y: -62)
            .opacity(isShowingObjectName ? 0.9 : 0)
        )
    }
}
