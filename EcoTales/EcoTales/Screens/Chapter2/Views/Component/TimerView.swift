//
//  TimerView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/16.
//

import SwiftUI

struct TimerView: View {
    @State var progress: CGFloat = 0.98
    @State var isGameFinish: Bool = false

    var body: some View {
        VStack {
            ProgressBar(initialProgress: $progress)
            Button {
                timer()
            } label: {
                Text("Start")
            }
        }

    }

    func timer() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            progress -= 0.01
            if progress <= 0 {
                isGameFinish = true
                timer.invalidate()
            }
        }
    }
}

struct ProgressBar: View {
    @Binding var progress: CGFloat

    init(initialProgress: Binding<CGFloat>) {
        self._progress = initialProgress
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15, style: .circular)
                    .foregroundColor(.PauseFillBrown)
                    .frame(height: geo.size.height)

                RoundedRectangle(cornerRadius: 15, style: .circular)
                    .fill(.red)
                    .frame(width: min(geo.size.width, geo.size.width * progress), height: geo.size.height * 0.5)
                    .animation(.linear, value: progress)

                Image(ImageLiteral.chapter2Timer)
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height * 1.5, alignment: .leading)
                    .offset(x: -10, y: 0)
            }
        }
        .frame(height: 25)
        .padding()
    }

}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
