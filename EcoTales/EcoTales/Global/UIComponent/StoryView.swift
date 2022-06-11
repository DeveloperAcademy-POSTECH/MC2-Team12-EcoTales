//
//  StoryView.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/10.
//
import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack {
            Image("ChapterOneBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
            HStack(spacing: 300) {
                Image("Rain")
                    .resizable()
                    .frame(width: 150.0, height: 240.0)

                Image("MainCharacter")
                    .resizable()
                    .frame(width: 140.0, height: 250.0)
            }
            .padding(EdgeInsets(top: 50, leading: 50, bottom: 10, trailing: 50))
            VStack {
                Spacer()
                ZStack(alignment: .topLeading) {
                    Text("내용, 이건 내용압니다, 진짜 무슨 말을 써야할 지 모르겠는데 내용은 아무튼 맞음,aksdfjadksfjkfjadsfasdffa")
                        .frame(width: 650, height: 80, alignment: .topLeading)
                        .lineSpacing(10)
                        .background(
                            Image("ConversationField")
                                .resizable()
                                .frame(width: 750, height: 150)
                        )
                        .padding(.top, 45)
                    Text("Rain")
                        .frame(width: 120, height: 30, alignment: .center)
                        .lineSpacing(10)
                        .background(
                            Image("ConversationNameField")
                                .resizable()
                                .frame(width: 140, height: 50)
                        )
                }
            }
            .padding(.bottom, 30)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
