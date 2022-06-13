//
//  HiddenTrashData.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/11.
//

import Foundation

struct HiddenObjectData: Hashable {
    static var List = [
        HiddenObject(image: "hidden_can", objectName: "음료수 캔",
                     positionX: 758, positionY: 210, rotation: 270, opacity: 1,
                     description: "음료수 캔은 해수욕장에서 가장 많이 발견되는 쓰레기 중 하나야."),
        HiddenObject(image: "hidden_plasticBottle", objectName: "플라스틱 물병",
                     positionX: 513, positionY: 159, rotation: 270, opacity: 0.9,
                     description: "플라스틱 쓰레기는 미세플라스틱이 되어 우리에게도 나쁜 영향을 줘."),
        HiddenObject(image: "hidden_toothBrush", objectName: "칫솔",
                     positionX: 642, positionY: 172, rotation: 45, opacity: 1,
                     description: "칫솔모가 분리되지 않은 칫솔은 재활용이 되지 않는 쓰레기야."),
        HiddenObject(image: "hidden_plasticBag", objectName: "비닐봉지",
                     positionX: 95, positionY: 109, rotation: 45, opacity: 0.8,
                     description: "비닐봉지를 그냥 버리면 자연 분해되는데 15년 이상의 시간이 걸려."),
        HiddenObject(image: "hidden_smoking", objectName: "담배꽁초",
                     positionX: 620, positionY: 247, rotation: 0, opacity: 1,
                     description: "아무렇게나 버린 담배꽁초는 빗물에 쓸려 바다로 흘러가."),
        HiddenObject(image: "hidden_cutlery", objectName: "플라스틱 숟가락과 포크",
                     positionX: 267, positionY: 207, rotation: 270, opacity: 1,
                     description: "한 번 쓰고 버리는 일회용 수저는 사용을 줄이는 것이 좋아."),
        HiddenObject(image: "hidden_straw", objectName: "플라스틱 빨대",
                     positionX: 50, positionY: 180, rotation: 260, opacity: 1,
                     description: "무심코 버린 빨대가 바다거북이의 코에 박혀 발견된 적이 있어."),
        HiddenObject(image: "hidden_plasticCup", objectName: "일회용 음료 컵",
                     positionX: 221, positionY: 240, rotation: 0, opacity: 0.9,
                     description: "일회용 플라스틱 컵은 해수욕장 쓰레기 1위야."),
        HiddenObject(image: "hidden_glassBottle", objectName: "유리병",
                     positionX: 414, positionY: 200, rotation: 300, opacity: 1,
                     description: "유리 쓰레기는 작게 깨져 바다 생물들의 생명을 위협할 수 있어."),
        HiddenObject(image: "hidden_snack", objectName: "과자 봉지",
                     positionX: 91, positionY: 272, rotation: 270, opacity: 0.8,
                     description: "과자봉지 역시 바다에서 많이 발견되는 쓰레기야.")
    ]
}
