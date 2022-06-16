//
//  EpilogueThree.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/11.
//

import SwiftUI

struct EpilogueThree: View {
    var body: some View {
        ZStack {
            Image("backgroundPolluted")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("woodenPanel")
                Spacer()
//                ObjectsToFindView()
            }
//            ObjectsHiddenView()
        }
    }
}

struct EpilogueThree_Previews: PreviewProvider {
    static var previews: some View {
        EpilogueThree()
    }
}
