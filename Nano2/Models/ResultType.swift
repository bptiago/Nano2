//
//  ResultOptions.swift
//  Nano2
//
//  Created by Tiago Prestes on 28/09/25.
//

import Foundation
import DeveloperToolsSupport

enum ResultType: Int {
    case noMoney
    case misery
    case goodEnough
    case perfect
    
    static func from(_ score: Int) -> ResultType {
            if score < 40 {
                let i = Int.random(in: 0...1)
                return ResultType(rawValue: i)!
            } else if score < 60 {
                return .goodEnough
            } else {
                return .perfect
            }
        }
    
    var image: ImageResource {
        return switch self {
        case .noMoney:
                .noMoney
        case .misery:
                .misery
        case .goodEnough:
                .goodEnough
        case .perfect:
                .perfect
        }
    }
    
    var title: String {
        return switch self {
        case .noMoney, .misery:
            "O tempo foi curto..."
        case .goodEnough:
            "Boaa. Foi correria mas deu certo!"
        case .perfect:
            "Não tinha como ser melhor!"
        }
    }
    
    var description: String {
        return switch self {
        case .noMoney:
            "Vocês perderam a mão no mercado e gastaram mais do que deveriam. Tem muita comida e bebida, mas falta saldo pra encarar o mês."
        case .misery:
            "Vocês se enrolaram ali no segundo tempo e não conseguiram se organizar. Agora o rolê tá meio improvisado, nada do jeito que vocês queriam."
        case .goodEnough:
            "A galera se organizou direitinho e tá todo mundo curtindo, mas faltou umas coisinhas... Acabou que na correria vocês esqueceram de pegar algumas coisas a mais para comer."
        case .perfect:
            "Vocês se organizaram direitinho e o rolê foi na medida. Todo mundo curtiu, gastou certinho e saiu feliz."
        }
    }
    
    var endingPhrase: String {
        return switch self {
        case .noMoney:
            "O rolê tá garantido, já a vida financeira… só Deus sabe."
        case .misery:
            "Mas já que tamo aqui, bora aproveitar né."
        case .goodEnough:
            "Mas não esquenta, tá mídia."
        case .perfect:
            "Foi tudo redondinho, do jeito que tinha que ser."
        }
    }
}
