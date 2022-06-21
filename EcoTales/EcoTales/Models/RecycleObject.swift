//
//  RecycleObject.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/16.
//

import SwiftUI

enum RecycleObject: Int {
    case litter = 0
    case egg
    case bag
    case snack
    case coke
    case drink
    case straw
    case water
    case box
    case newspaper
    case cup
    case mug

    func recycleObjectType() -> LocalizedStringKey {
        switch self {
        case .litter, .egg:
            return "일반쓰레기"
        case .snack, .bag:
            return "비닐"
        case .coke, .drink:
            return "캔"
        case .straw, .water:
            return "플라스틱"
        case .box, .newspaper:
            return "종이"
        case .cup, .mug:
            return "유리"
        }
    }

    func recycleObjectImage() -> String {
        switch self {
        case .litter:
            return ImageLiteral.recycleGameLitter
        case .egg:
            return ImageLiteral.recycleGameEgg
        case .bag:
            return ImageLiteral.recycleGamePlasticBag
        case .snack:
            return ImageLiteral.recycleGameSnack
        case .coke:
            return ImageLiteral.recycleGameCoke
        case .drink:
            return ImageLiteral.recycleGameDrink
        case .straw:
            return ImageLiteral.recycleGameStraw
        case .water:
            return ImageLiteral.recycleGameWater
        case .box:
            return ImageLiteral.recycleGamePaperBox
        case .newspaper:
            return ImageLiteral.recycleGameNewspaper
        case .cup:
            return ImageLiteral.recycleGameGlassCup
        case .mug:
            return ImageLiteral.recycleGameMug
        }
    }
}
