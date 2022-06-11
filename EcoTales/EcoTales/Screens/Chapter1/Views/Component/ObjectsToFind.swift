//
//  ObjectsToFind.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct ObjectsToFind: View {
    @State private var isShowingObjectName = false
    @State private var selectedObject: String = "none"
    @State private var selectedObjectPosX: CGFloat = 0

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 70)
                .opacity(0.3)
            HStack {
                ForEach(hiddenObject, id: \.self) { trash in
//                    GeometryReader { proxy in
                        Button(action: {
                            withAnimation { isShowingObjectName.toggle() }
                            selectedObject = trash.objectName
//                            selectedObjectPosX = proxy.frame(in: .local).midX
                        }, label: {
                            Image(trash.image)
                                .frame(maxWidth: .infinity)
                        })
//                    }
                }
            }
            .padding([.trailing, .leading], 20)
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
                .offset(x: selectedObjectPosX, y: -62)
                .opacity(isShowingObjectName ? 0.9 : 0)
            )
        }
        .padding([.leading, .trailing], 44)
    }
}

struct ObjectsToFind_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsToFind()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
