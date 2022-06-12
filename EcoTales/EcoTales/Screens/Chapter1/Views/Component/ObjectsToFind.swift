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
    @State private var selectedObjectPosition: CGRect = .zero

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 70)
                .opacity(0.3)
            HStack {
                ForEach(hiddenObject, id: \.self) { trash in
                        Button(action: {
                            withAnimation { isShowingObjectName.toggle() }
                            selectedObject = trash.objectName
//                            selectedObjectPosition = CGPoint(x: trash.positionX, y: trash.positionY)
                        }, label: {
                                Image(trash.image)
                                    .frame(maxWidth: .infinity)
//                                    .background(
//                                        GeometryReader { proxy in
//                                            onTapGesture {
//                                                selectedObjectPosition = proxy.frame(in: .global)
//                                            }
//                                        }
//                                    )

                        })
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
                .offset(x: 0, y: -62)
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
