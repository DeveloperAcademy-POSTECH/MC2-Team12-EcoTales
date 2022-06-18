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
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15, style: .circular)
                    .foregroundColor(.TimerBackgroundBrown)
                    .frame(height: geo.size.height)

                RoundedRectangle(cornerRadius: 15, style: .circular)
                    .foregroundColor(.TimerProgressRed)
                    .frame(width: min(geo.size.width, geo.size.width * progress), height: geo.size.height * 0.5)
                    .animation(.linear, value: progress)

                Image(ImageLiteral.chapter2Timer)
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height * 1.5, alignment: .leading)
                    .offset(x: -10, y: 0)
            }
        }
        .frame(height: 23)
        .padding([.horizontal, .bottom], 10)
        .padding(.leading, 15)
        .onAppear(perform: { timer() })
    }

    func timer() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            progress -= 0.003
            if progress <= 0 {
                isGameFinish = true
                timer.invalidate()
            }
        }
    }

}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
