//
//  ObjectsHiddenView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/11.
//

import SwiftUI

struct ObjectsHiddenView: View {
    @Binding var foundTrash: Set<String>
    var hiddenObjectList = HiddenObjectData().list

    var body: some View {
        ZStack {
            ForEach(hiddenObjectList, id: \.self) { trash in
                TrashView(trash: trash, foundTrash: $foundTrash)
            }
        }
    }
}
