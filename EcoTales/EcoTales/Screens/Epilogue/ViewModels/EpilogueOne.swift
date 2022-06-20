//
//  EpilogueOne.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/11.
//

import SwiftUI

struct EpilogueOne: View {
    let images = [ImageLiteral.chapter3CleanBackground,
                  ImageLiteral.chapter2CleanBackground,
                  ImageLiteral.chapter1CleanBackground,
                  ImageLiteral.chapter1CleanBackground]

    @State private var currentImageIndex = 0
    @State private var isFinished = false

    var body: some View {
            NavigationView {
                if isFinished {
                    NavigationLink(isActive: $isFinished,
                                   destination: { EpilogueTwo() },
                                   label: { Image(ImageLiteral.chapter1CleanBackground) })
                } else {
                    VStack {
                        Image(images[currentImageIndex])
                            .resizable()
                            .ignoresSafeArea()
                            .id(currentImageIndex)
                            .onAppear(perform: { timer() })
                    }
                    .animation(.easeInOut(duration: 2), value: currentImageIndex)
                }
            }
            .navigationBarHidden(true)
        }

        func timer() {
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
                if currentImageIndex + 1 == images.count - 1 {
                    isFinished = true
                    timer.invalidate()
                }
                currentImageIndex += 1
            }
        }
}

struct EpilogueOne_Previews: PreviewProvider {
    static var previews: some View {
        EpilogueOne()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
