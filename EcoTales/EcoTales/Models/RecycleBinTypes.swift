//
//  RecycleBins.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/16.
//

enum RecycleBinTypes {
    case recycleBinLitter
    case recycleBinVinyl
    case recycleBinCan
    case recycleBinPlastic
    case recycleBinPaper
    case recycleBinGlass
    
    func recycleName() -> String {
        switch self {
        case .recycleBinLitter:
            return "일반쓰레기"
        case .recycleBinVinyl:
            return "비닐"
        case .recycleBinCan:
            return "캔"
        case .recycleBinPlastic:
            return "플라스틱"
        case .recycleBinPaper:
            return "종이"
        case .recycleBinGlass:
            return "유리"
        }
    }
    
    func recycleImage() -> String {
        switch self {
        case .recycleBinLitter:
            return ImageLiteral.recycleBinLitter
        case .recycleBinVinyl:
            return ImageLiteral.recycleBinVinyl
        case .recycleBinCan:
            return ImageLiteral.recycleBinCan
        case .recycleBinPlastic:
            return ImageLiteral.recycleBinPlastic
        case .recycleBinPaper:
            return ImageLiteral.recycleBinPaper
        case .recycleBinGlass:
            return ImageLiteral.recycleBinGlass
        }
    }
}
