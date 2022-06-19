//
//  Font+Extension.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/19.
//

import SwiftUI

extension Font {
    struct MapleFont {
            let title = Font.custom("Maplestory OTF Bold", size: 92)
            let subtitle = Font.custom("Maplestory OTF Bold", size: 30)
            let startButton = Font.custom("Maplestory OTF Bold", size: 20)
        }

    struct SeoulHangangM {
        let story = Font.custom("SeoulHangangM", size: 20)
    }

    static let mapleFont = MapleFont()
    static let seoulHangangM = SeoulHangangM()
}
