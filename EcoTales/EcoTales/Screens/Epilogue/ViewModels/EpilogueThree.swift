//
//  EpilogueThree.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/11.
//

import SwiftUI

struct EpilogueThree: View {
    let images = ["chapterThree_cleanBackground", "chapterTwo_background", "chapterOne_cleanBackground"]
    let imageChangeTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentImageIndex = 0
    var body: some View {
        ZStack {
            Image(images[currentImageIndex])
                .resizable()
                .ignoresSafeArea()
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
                .onReceive(imageChangeTimer) { _ in
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.currentImageIndex = (self.currentImageIndex + 1) % self.images.count
                    }
                }
        }
    }
}

struct EpilogueThree_Previews: PreviewProvider {
    static var previews: some View {
        EpilogueThree()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
