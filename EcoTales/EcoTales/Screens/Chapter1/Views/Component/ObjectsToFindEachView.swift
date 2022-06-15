//
//  ObjectsToFindEachView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/12.
//
//
import SwiftUI

struct ObjectsToFindEachView: View {
    @State private var isShowingObjectName = false
    @State private var selectedObject = "none"
    var trash: HiddenObject
    @Binding var foundTrash: Set<String>

    var body: some View {
            Button(action: {
                isShowingObjectName.toggle()
                withAnimation(Animation.easeOut(duration: 0.5).delay(1.0)) {
                    isShowingObjectName.toggle()
                }
                selectedObject = trash.objectName
            }, label: {
                Image(trash.image)
                    .frame(maxWidth: .infinity)
            })
            .overlay(
                Text(selectedObject)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .frame(width: 90, height: 45)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 3, x: 3, y: 3)
                    .offset(x: 0, y: -62)
                    .opacity(isShowingObjectName ? 0.9 : 0)
            )
            .opacity(!foundTrash.contains(trash.image) ? 1 : 0)
    }
}
