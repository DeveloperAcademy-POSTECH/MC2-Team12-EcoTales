//
//  RecycleObject.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/16.
//

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
    
    func recycleObjectName() -> String {
        switch self {
        case .litter:
            return "일반쓰레기"
        case .snack:
            return "비닐"
        case .coke:
            return "캔"
        case .straw:
            return "플라스틱"
        case .box:
            return "종이"
        case .cup:
            return "유리"
        case .egg:
            return "일반쓰레기"
        case .bag:
            return "비닐"
        case .drink:
            return "캔"
        case .water:
            return "플라스틱"
        case .newspaper:
            return "종이"
        case .mug:
            return "유리"
        }
    }

    func recycleObjectImage() -> String {
        switch self {
        case .litter:
            return ImageLiteral.litter
        case .egg:
            return ImageLiteral.egg
        case .bag:
            return ImageLiteral.bag
        case .snack:
            return ImageLiteral.snack
        case .coke:
            return ImageLiteral.coke
        case .drink:
            return ImageLiteral.drink
        case .straw:
            return ImageLiteral.straw
        case .water:
            return ImageLiteral.water
        case .box:
            return ImageLiteral.box
        case .newspaper:
            return ImageLiteral.newspaper
        case .cup:
            return ImageLiteral.cup
        case .mug:
            return ImageLiteral.mug
        }
    }
}
