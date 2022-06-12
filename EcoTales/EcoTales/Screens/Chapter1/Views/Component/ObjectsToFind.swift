//
//  ObjectsToFind.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct ObjectsToFind: View {
//    @State private var isShowingObjectName = false
//    @State private var selectedObject = "none"
//    @State private var selectedObjectPosition: CGRect = .zero

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 70)
                .opacity(0.3)
            HStack {
                ForEach(hiddenObject, id: \.self) { trash in
                    ObjectsToFindButton(trash: trash)
                }
            }
            .padding([.trailing, .leading], 20)
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
