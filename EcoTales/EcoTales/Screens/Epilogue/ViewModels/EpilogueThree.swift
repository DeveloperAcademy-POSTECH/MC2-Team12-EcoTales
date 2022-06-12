//
//  EpilogueThree.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/11.
//

import SwiftUI

struct EpilogueThree: View {
    let images = ["chapterThree_cleanBackground", "chapterTwo_background", "chapterOne_cleanBackground"]
    let imageChangeTimer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    let transition = AnyTransition.asymmetric(insertion: .slide, removal: .scale).combined(with: .opacity)
    @State private var imagePage = 2
    @State private var currentImageIndexCount = 3
    @State private var currentImageIndex = 0
    var body: some View {
        ZStack {
            VStack {
                Text("Page: \(imagePage)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                Image(images[currentImageIndex])
                    .resizable()
                    .ignoresSafeArea()
                // id를 사용해서 이미지를 움직일 수 있게 만들고, 아래에 애니메이션 컨테이너를 추가한다.
                // https://stackoverflow.com/questions/72591037/animation-doesnt-work-on-anytransition-swiftui
                    .id(imagePage)
                    .transition(transition)
                    .onReceive(imageChangeTimer) { _ in
                        if imagePage > 0 {
                            self.currentImageIndex = (self.currentImageIndex + 1) % self.images.count
                            imagePage -= 1
                        }
                    }
            }
            .animation(.easeInOut(duration: 2), value: imagePage)  // << here !!
        }
    }
}

struct EpilogueThree_Previews: PreviewProvider {
    static var previews: some View {
        EpilogueThree()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
