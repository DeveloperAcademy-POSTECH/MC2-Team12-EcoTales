//
//  BackgroundImage.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/16.
//

import SwiftUI

struct BackgroundImage: View {
    let imageName: String

    init(_ image: String) {
        imageName = image
    }

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }

}
