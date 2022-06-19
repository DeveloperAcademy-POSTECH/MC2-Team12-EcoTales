//
//  ObjectsToFindView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct ObjectsToFindView: View {
    var hiddenObjectList = HiddenObjectData().list
    @Binding var foundTrash: Set<String>
    var body: some View {
        ZStack {
            if foundTrash.count != 10 {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 70)
                    .opacity(0.3)
            }
            HStack {
                ForEach(hiddenObjectList, id: \.self) { trash in
                    ObjectsToFindEachView(trash: trash, foundTrash: $foundTrash)
                }
            }
            .padding([.trailing, .leading], 20)
        }
        .padding(.horizontal, 44)
        .padding(.bottom, 21)
    }
}
