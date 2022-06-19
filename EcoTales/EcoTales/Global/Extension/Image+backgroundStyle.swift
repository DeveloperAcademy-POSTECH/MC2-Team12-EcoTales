//
//  Image+Extension.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/15.
//

import SwiftUI

extension Image: ViewModifier {
    /**
     이미지를 배경에 맞게 만들어 주는 Modifier
     
     이미지에 사용하면 이미지를 SafeArea를 무시하고 배경에 꽉 차게 만들어 줍니다
     
     **Example**
     ```
     Image("imageName").backgroundImage()
     ```
     */
    func backgroundStyle() -> some View {
        self
            .resizable()
            .ignoresSafeArea()
    }
}
