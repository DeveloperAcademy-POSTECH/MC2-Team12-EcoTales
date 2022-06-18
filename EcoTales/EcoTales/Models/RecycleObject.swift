//
//  RecycleObject.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/16.
//

enum RecycleObject: Int {
    case recycleGameLitter = 0
    case recycleGameEgg
    case recycleGamePlasticBag
    case recycleGameSnack
    case recycleGameCoke
    case recycleGameDrink
    case recycleGameStraw
    case recycleGameWater
    case recycleGamePaperBox
    case recycleGameNewspaper
    case recycleGameGlassCup
    case recycleGameMug

    func recycleObjectType() -> String {
        switch self {
        case .recycleGameLitter, .recycleGameEgg:
            return "일반쓰레기"
        case .recycleGameSnack, .recycleGamePlasticBag:
            return "비닐"
        case .recycleGameCoke, .recycleGameDrink:
            return "캔"
        case .recycleGameStraw, .recycleGameWater:
            return "플라스틱"
        case .recycleGamePaperBox, .recycleGameNewspaper:
            return "종이"
        case .recycleGameGlassCup, .recycleGameMug:
            return "유리"
        }
    }

    func recycleObjectImage() -> String {
        switch self {
        case .recycleGameLitter:
            return ImageLiteral.recycleGameLitter
        case .recycleGameEgg:
            return ImageLiteral.recycleGameEgg
        case .recycleGamePlasticBag:
            return ImageLiteral.recycleGamePlasticBag
        case .recycleGameSnack:
            return ImageLiteral.recycleGameSnack
        case .recycleGameCoke:
            return ImageLiteral.recycleGameCoke
        case .recycleGameDrink:
            return ImageLiteral.recycleGameDrink
        case .recycleGameStraw:
            return ImageLiteral.recycleGameStraw
        case .recycleGameWater:
            return ImageLiteral.recycleGameWater
        case .recycleGamePaperBox:
            return ImageLiteral.recycleGamePaperBox
        case .recycleGameNewspaper:
            return ImageLiteral.recycleGameNewspaper
        case .recycleGameGlassCup:
            return ImageLiteral.recycleGameGlassCup
        case .recycleGameMug:
            return ImageLiteral.recycleGameMug
        }
    }
}
