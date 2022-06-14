//
//  EpilogueThree.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/11.
//

import SwiftUI

struct EpilogueThree: View {
    let images = ["chapter3_cleanBackground", "chapter2_background", "chapter1_cleanBackground"]
    let imageChangeTimer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @State private var imagePage = 2
    @State private var currentImageIndex = 0
    var body: some View {
        ZStack {
            Image(images[currentImageIndex])
                .resizable()
                .ignoresSafeArea()
                .id(imagePage)
                .onReceive(imageChangeTimer) { _ in
                    if imagePage > 0 {
                        self.currentImageIndex = (self.currentImageIndex + 1) % self.images.count
                        imagePage -= 1
                    }
                }
        }
        .animation(.easeInOut(duration: 2), value: imagePage)
    }
}

struct EpilogueThree_Previews: PreviewProvider {
    static var previews: some View {
        EpilogueThree()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
