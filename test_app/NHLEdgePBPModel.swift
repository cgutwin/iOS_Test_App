//
//  NHLEPBPModel.swift
//  test_app
//
//  Created by Chris Gutwin on 2024-03-01.
//

import Foundation

struct NHLEdgePBPModel: Decodable {
    let id, season, gameType: Int
    let gameDate: String
    let venue: Venue
    let gameState: String
    let period: Int
    let plays: [Plays]
}

struct Venue: Decodable {
    let venue: String
    
    enum CodingKeys: String, CodingKey {
        case venue = "default"
    }
}

struct PeriodDescriptor: Decodable {
    let number: Int
    let periodType: String
}

struct Plays: Decodable {
    let eventId, period: Int
    let periodDescriptor: PeriodDescriptor
    let timeInPeriod, timeRemaining, situationCode, homeTeamDefendingSide: String
    let typeCode: Int
    let typeDescKey: String
}
