//
//  StoryDataModel.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/09.
//

import SwiftUI

enum Speaker: String {
    case naration
    case photo
    case chapter1Photo
    case child
    case turtle
    case rain
    case mole
    case dirtySherry
    case sherry
    case ozz
    case meenu
    case redpandaAll
    case redpandaA
    case redpandaB
    case redpandaC

    func speakerName() -> LocalizedStringKey {
        switch self {
        case .child:
            return "아이"
        case .turtle:
            return "거북이"
        case .rain:
            return "레인"
        case .mole:
            return "두더지"
        case .dirtySherry:
            return "쉐리"
        case .sherry:
            return "쉐리"
        case .ozz:
            return "오즈"
        case .meenu:
            return "미뉴"
        case .redpandaAll:
            return "레서 판다 A, B, C"
        case .redpandaA:
            return "레서 판다 A"
        case .redpandaB:
            return "레서 판다 B"
        case .redpandaC:
            return "레서 판다 C"
        default:
            return "오류"
        }
    }
}

struct StoryDataModel {
    let speaker: [Speaker]
    let dialog: [LocalizedStringKey]
//    var isReadyToUse: Bool
}

let abc: [StoryDataModel] = []

struct StoryData {
    let chapterError = StoryDataModel(
        speaker: [.naration],
        dialog: ["에러가 발생했습니다!"]
    )

    let chapterIntro = StoryDataModel(
        speaker: [.naration],
        dialog: ["인트로"]
    )

    let chapterOneNotClear = StoryDataModel(
        speaker: [.naration, .child, .turtle, .child, .child, .turtle,
                  .child, .turtle, .child, .rain, .child, .rain, .child, .rain],
        dialog: ["아이는 근처 바다에 도착했어요.",
                 "와 바다다! 여기라면 깨끗한 소금물 한 바가지를 구할 수 있겠지?",
                 "아이고.. 힘들다 힘들어",
                 "어? 거북이다. 거북이한테 물어볼까?",
                 "안녕 거북아?",
                 "누구냐 넌! 너도 바다를 더럽히러 온 거야? 내가 혼쭐을 내주마!",
                 "잠깐만, 아니야! 나는 바다의 깨끗한 소금물 한 바가지를 구하러 왔어",
                 "깨끗한 소금물 한 바가지?",
                 "응! 너 혹시 그게 어디있는지 아니 거북아?",
                 "내 이름은 레인이야. 지금은 깨끗한 소금물 한 바가지를 구할 수 없어.",
                 "레인이었구나! 그런데 구할 수 없다니? 왜?!",
                 "여길 봐. 바다가 쓰레기로 뒤덮여 있잖아. 이렇게 더러운 곳에 그런게 있겠어? 나도 바다를 청소하고 있지만, 나는 너무 느려서 언제 다 할 수 있을지 모르겠어.",
                 "그럼 내가 도와줄게! 같이 청소하자.",
                 "와 고마워. 그러면 바다에서 쓰레기를 찾아서 없애보자!"]
    )

    let chapterOneClear = StoryDataModel(
        speaker: [.rain, .child, .rain, .child, .rain, .chapter1Photo, .rain,
                  .naration, .naration, .naration, .naration, .naration, .naration],
        dialog: ["참 잘했어! 네 덕분에 바다가 깨끗해졌어. 이제 이 바다에는 쓰레기들 때문에 죽는 친구들이 없어질거야",
                 "내가 도움이 되었다니 다행이야",
                 "자, 이게 바로 깨끗한 소금물 한 바가지야. 이걸로 네 친구를 꼭 치료하길 바라..",
                 "난 이제 대지의 흙 한 줌을 구하러 갈 거야. 레인, 너는?",
                 "이 바다는 깨끗해졌지만, 아직 다른 바다는 쓰레기들 때문에 죽어가는 친구들이 이렇게 많아.",
                 "",
                 "난 이제 다른 바다를 청소하러 갈거야. 고마웠어 안녕~",
                 "아이는 길을 가면서 곰곰이 생각해봤어요.",
                 "바다에 있는 쓰레기는 아이에게 익숙한 것들이었어요.",
                 "평소에 들고 다녔던 물통, 즐겨먹던 플라스틱 도시락, 매일 사용하던 빨대...",
                 "아이는 자신의 행동을 되돌아봤어요.",
                 "내가 많이 사용했던 물건들이 쉽게 쓰레기가 되는구나...",
                 "앞으로는 바다 친구들을 위해서 조금씩 줄어야겠다.",
                 "아이는 다짐하며 대지의 마을을 향해 발길을 재촉했어요."]
    )

    let chapterTwoNotClear = StoryDataModel(
        speaker: [.naration, .naration, .mole, .child, .dirtySherry, .child, .dirtySherry, .child,
                  .dirtySherry, .child, .dirtySherry, .child, .dirtySherry, .child, .dirtySherry, .dirtySherry, .child],
        dialog: ["아이는 대지의 흙 한 줌을 찾기 위해 숲을 향해 걸었어요. 숲에 도착했지만 오염물질과 쓰레기가 많아 마땅한 흙을 찾기 어려웠어요.",
                 "계속 걸어가고 있던 중, 마침 땅 속에서 나온 두더지를 마주쳤어요.",
                 "아이 참.. 이것 참 곤란하네..",
                 "두더지야 안녕~",
                 "하나도 안녕하지 못해. 난 쉐리야",
                 "무슨 일 있니, 쉐리?",
                 "기껏 새 옷을 샀는데, 이걸 봐 여기 이 더러운 쓰레기들 때문에 새로산 내 옷이 다 더러워져 버렸어.",
                 "저런.. 참 안됐구나..",
                 "그런데 여긴 무슨 일로 온 거야?",
                 "아, 나는 대지의 흙 한 줌을 찾고 있어. 혹시 어디에 있는지 아니?",
                 "네가 찾는 대지의 흙 한 줌은 여기에 없어. 저 아무렇게나 버려진 쓰레기들 때문이지",
                 "그럼 어쩌지..",
                 "저 쓰레기들을 분리수거해 볼까? 그러면 니가 원하는 대지의 흙 한 줌을 구할 수 있을거야.",
                 "좋아, 하지만 쉐리. 나는 분리수거를 어떻게 해야하는지 잘 몰라..",
                 "걱정마. 내가 알려줄게.",
                 "여기 쓰레기들 보이지? 이 쓰레기는 플라스틱, 이건 캔, 이건 종이야! 내가 땅에서 쓰레기를 주워서 컨베이어 벨트에 올려줄테니 너는 쓰레기를 잘 분류해줘",
                 "좋아, 한번 도전해볼게"]
    )

    let chapterTwoClear = StoryDataModel(
        speaker: [.sherry, .sherry, .child, .sherry, .child, .sherry, .chapter1Photo, .sherry, .child, .sherry, .child],
        dialog: ["좋았어! 이제 좀 신나는걸!!",
                 "잘했어 아이야~ 이게 바로 대지의 흙 한 줌이야.",
                 "이게 다 네 덕분이야 쉐리~",
                 "아니야 다 네가 잘 해줬기 때문이야.",
                 "이제 땅도 깨끗해졌으니 쉐리 네 옷들도 더러워지지 않겠다.",
                 "덕분에 내 옷들이 더러워지지 않을 수 있을 것 같아. 하지만 앞으로도 분리수거를 제대로 하지 않으면 다시 땅이 더러워지겠지..",
                 "",
                 "아 생각하기도 싫다!!",
                 "걱정마 쉐리, 앞으로 나도 분리수거를 열심히 할게",
                 "고마워, 그럼 잘가~",
                 "응 안녕 쉐리~"]
    )

    let chapterThreeNotClear = StoryDataModel(
        speaker: [.naration, .child, .naration, .ozz, .child, .ozz, .child, .ozz, .child, .ozz],
        dialog: ["아이는 마지막 재료인 청량한 공기 한 숨을 얻기 위해 높은 산 꼭대기에 올라갔어요.",
                 "오늘은 참 날씨가 더운데도 하늘이 뿌옇네. 어디로 가야 청량한 공기 한 숨을 구할 수 있는 걸까? 너무 더우니 잠시 저 나무 밑에서 쉬어가야겠어.",
                 "아이가 작은 나무에 기대자, 나뭇가지가 조금 흔들렸어요.",
                 "콜록 콜록.. 누가 이 오즈님의 낮잠을 방해하는거야!",
                 "앗, 미안해, 오즈. 누가 있는지 몰랐어.",
                 "콜록 콜록.. 여긴 공기가 안 좋아서 동물들이 없고 조용해. 넌 무슨 일로 이 곳에 온 거야?",
                 "세계수가 많이 아파. 비약의 재료인 청량한 공기 한 숨을 찾고 있어.",
                 "저기 사람들이 만든 공장들과 수많은 자동차들이 보이지? 콜록.. 저것들이 우리가 사는 지구의 공기를 오염시키고 있어.",
                 "우리가 매일 마시는 공기를? 그럼 어떻게 해야 하지?",
                 "응. 옛날에 그것들이 없었던 때는 항상 공기가 맑고 하늘이 파랬어. 예전과 비교해서 지금 달라진 것들을 찾아서 없애면 괜찮아질지도 몰라."]
    )

    let chapterThreeClear = StoryDataModel(
        speaker: [.ozz, .child, .ozz, .child, .ozz, .child, .ozz, .child, .naration],
        dialog: ["고마워. 네 덕분에 이제 마스크를 쓰지 않아도 맑은 공기를 마실 수 있어. 보답으로 내가 만든 나뭇잎 주머니를 줄게.",
                 "우와... 이 주머니에 청량한 공기 한 숨을 담아 가면 되겠다. 드디어 세계수를 구할 비약의 재료 세 가지를 모두 모았어.",
                 "축하해 아이야.",
                 "고마워~ 이제 드디어 내 친구를 치료할 수 있게 됐어!",
                 "나도 네 덕분에 기침이 멈추게 됐어",
                 "정말 잘 됐다!",
                 "고마워~ 네 친구를 꼭 치료할 수 있길 바라 아이야.",
                 "응 고마워 오즈. 안녕~",
                 "그렇게 아이는 세 가지 재료를 모두 모아 레서판다씨를 찾아가기 시작했습니다."]
    )

    let chapterFourNotClear = StoryDataModel(
        speaker: [.child, .child, .child, .redpandaAll, .child, .redpandaA, .child,
                  .redpandaB, .child, .redpandaC, .child, .naration, .naration],
        dialog: ["드디어 레서판다 마을이다!",
                 "그런데 레서판다가... 많아!!",
                 "독수리아가 얘기한대로면 분명 미뉴는 이 중 한 분이실텐데...",
                 "판다~",
                 "혹시 미뉴이신가요?",
                 "미뉴이신가요~",
                 "혹시 당신이 미뉴이신가요?",
                 "미뉴이신가요~",
                 "혹시 당신이 미뉴이신가요?",
                 "미뉴이신가요~",
                 "(그러고 보니... 레서 판다들은 평상시 장난기가 많다고 들었어... 이 중에서 진짜 미뉴를 찾아보자!)",
                 "레서 판다의 마을에 왔지만 장난기가 많은 레서 판다 미뉴가 친구들 사이에 숨어있네요.",
                 "미뉴를 찾아봐요!"]
    )

    let chapterFourClear = StoryDataModel(
        speaker: [.child,
                  .child,
                  .child,
                  .meenu,
                  .meenu,
                  .naration,
                  .naration,
                  .child,
                  .naration,
                  .naration,
                  .meenu,
                  .child,
                  .meenu,
                  .naration],
        dialog: ["레서 판다 미뉴! 여기에 계셨군요!",
                 "지난 봄에 왔을 때는 조용하고 황량한 곳이었는데, 지금은 엄청 아름다워요!",
                 "처음 보는 판다들도 많아요",
                 "그래. 대나무 숲이 생기를 되찾고 나서, 떠났던 레서 판다들이 다시 돌아왔단다.",
                 "오랜만에 보니 반갑구나. 무슨 일이니?",
                 "아이는 그동안 마을에 생긴 일과 세계수에 대한 것을 미뉴에게 말해주었어요.",
                 "그리고 바다의 깨끗한 소금물 한 바가지, 대지의 흙 한 줌, 청량한 공기 한 숨을 주머니에서 꺼내며 말했어요.",
                 "미뉴! 치료약을 만들 재료를 여기 다 찾아왔어요! 이걸로 어서 세계수를 살릴 약을 만들어주세요.",
                 "어? 그런데 재료를 바라보는 미뉴의 표정이 의미심장하네요?",
                 "약을 만들 재료가 부족한 걸까요?",
                 "대단하구나 아이야. 네가 재료를 충분히 구해줬으니, 이제 세계수한테로 가볼까?",
                 "네? 치료약은요?",
                 "우선 나와 함께 가보자꾸나",
                 "아이는 고개를 갸우뚱 거리면서 미뉴를 따라 마을을 향해 발걸음을 옮겼어요."]
    )

    let chapterEpilogue = StoryDataModel(
        speaker: [.meenu,
                  .meenu,
                  .chapter1Photo,
                  .meenu,
                  .meenu,
                  .meenu,
                  .child,
                  .meenu,
                  .meenu,
                  .meenu],
        dialog: ["아이야, 네가 한 행동은 정말 대단한 일이었어.",
                 "이걸 기념해서 네가 모아온 재료로 반지를 만들어 줄게",
                 "",
                 "지구 모양의 반지란다. 지구는 우리가 삶을 살아가는 터전이지.",
                 "세계수의 나뭇잎 모양 반지란다. 그리고 우리가 삶을 살아가는 터전인 자연을 의미하기도 하지.",
                 "...",
                 "미뉴, 무슨 일이 있는 거예요?",
                 "이 마을은 네 덕분에 깨끗해졌지만, 지구 세상에는 아직도 오염된 환경으로 인해 고통받는 친구들이 많단다.",
                 "아이야.. 너와 같은 아이들의 도움이 필요해.",
                 "나와 계속 함께하며 세계를 지키는 영웅이 되어보겠니?"]
    )

    let introOne: [LocalizedStringKey] = ["세상에서 가장 아름답고, 푸르른 마을에 한 아이가 살았어요.",
                                          "귀여운 다람쥐 이웃들, 듬직한 독수리 친구, 어머니 같이 포근한 세계수는 아이의 가족이 되어주었어요.",
                                          "아이와 친구들은 서로를 아껴주며 의지하며 행복하게 살고 있었어요."]

    let introTwo: [LocalizedStringKey] = ["그런데, 어느 날부터 하루가 지날수록 하늘이 어두워지고 날씨가 더워지기 시작했어요.",
                                          "아이도, 자연 친구들도 변한 날씨에 힘들어했어요.",
                                          "결국, 다정했던 세계수도 알 수 없는 병에 걸려버리고 말았어요.",
                                          "푸르고 빳빳했던 나뭇잎이 노랗게 변하고 시들해졌고,",
                                          "늘 아이를 안아주던 가지도 바람이 불면 부러질 듯이 약해보였어요.",
                                          "아이는 태어나서 느껴본 슬픔 중 가장 큰 슬픔을 느꼈어요."]

    let introThree: [LocalizedStringKey] = ["독수리는 아이가 매일 흐느끼며 우는 모습을 보니 마음이 너무 아팠어요.",
                                            "'이 문제를 해결할 수 있는 방법은 없을까?'",
                                            "고민하던 독수리는 하늘을 날아다니며 지혜로운 자를 찾아다녔어요.",
                                            "독수리가 답을 찾았는지, 다시 아이에게 왔네요.",
                                            "\"아이야, 레서판다 미뉴가 답을 알고 있대!\"",
                                            "\"판다 씨에게 몇 가지 재료만 가지고 가면, 병들어 있는 세계수를 치료할 치료약을 만들어 주신다고 하셨어\"",
                                            "\"정말로? 어떤 재료를 찾아가면 되는 거야? 정말로 이걸로 세계수를 살릴 수 있어?\"",
                                            "\"그럼. 치료약을 만드는 데 필요한 3가지 재료를 판다 씨에게 전해주면 돼.\"",
                                            "\"바다의 깨끗한 소금물 한 바가지, 대지의 흙 한 줌, 청량한 공기 한 숨을 찾아오렴. 나는 세계수를 돌보고 있을게\""]

    let introFour: [LocalizedStringKey] = ["\"알겠어! 나라도 무언가를 해봐야겠어! 나, 재료를 찾으러 다녀올게. 세계수를 잘 부탁해\"",
                                           "그 길로 아이는 바다의 깨끗한 소금물 한 바가지, 대지의 흙 한 줌, 청량한 공기 한 숨을 찾기 위한 여정을 떠났어요.",
                                           "어디에 가야 바다의 깨끗한 소금물 한 바가지를 구할 수 있을까요?"]

    let epilogueTwoSentence: [LocalizedStringKey] = ["세계수가 너무도 그리웠던 아이는, 한걸음에 언덕으로 달려갔어요.",
                                                     "그런데, 꿈만 같은 일이 일어났어요."]

    let epilogueTwoDialog: [LocalizedStringKey] = ["세계수가 싱싱하고 튼튼한 모습으로 아이를 맞이하는 것이 아니겠어요?",
                                                   "'어? 아직 치료약을 먹지 않았는데?'",
                                                   "아이는 크게 놀랐지만, 너무 기쁜 나머지 세계수의 품에 쏘옥 안겼어요.",
                                                   "\"아이야, 고맙구나. 네 힘으로 나를 살렸어.\"",
                                                   "\"그렇지만, 제가 가져온 재료가 아무 의미 없었는 걸요?\"",
                                                   "세계수는 아이를 쓰다듬으며 말했어요.",
                                                   "\"그렇지 않단다. 네가 청소한 바다의 깨끗한 물이 비가 되어 내 목을 적셨고,\"",
                                                   "\"네가 청소한 대지의 흙으로 나의 뿌리를 덮었고,\"",
                                                   "\"네가 청소한 대기의 공기로 내가 숨을 쉴 수 있었단다.\"",
                                                   "\"너의 행동 하나 하나가 나를 살렸어.\"",
                                                   "아이의 가슴은 따뜻해졌고, 얼굴에는 행복한 미소가 피었어요.",
                                                   "그 모습을 지켜본 레서 판다의 얼굴에도 미소가 걸렸어요."]
}
