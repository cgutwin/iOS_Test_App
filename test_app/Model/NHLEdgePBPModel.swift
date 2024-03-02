//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//
//  NHLEdgePBPModel.swift
//  test_app
//
//  Created by Chris Gutwin on 2024-03-01.
//

import Foundation

// MARK: - NHLEdgePBPData
struct NHLEdgePBPData: Decodable {
    let id, season, gameType: Int
    let gameDate: String
//    let venue: Venue
//    let startTimeUTC: Date
//    let easternUTCOffset, venueUTCOffset: String
//    let tvBroadcasts: [TvBroadcast]
    let gameState, gameScheduleState: String
    let period: Int
    let periodDescriptor: PeriodDescriptor
//    let awayTeam, homeTeam: Team
//    let clock: Clock
//    let rosterSpots: [RosterSpot]
    let displayPeriod: Int
    let gameOutcome: GameOutcome
//    let plays: [Play]
}

// MARK: - Team
struct Team: Decodable {
    let id: Int
    let name: Venue
    let abbrev: String
    let score, sog: Int
    let logo: String
    let onIce: [OnIce]
}

// MARK: - Venue
struct Venue: Decodable {
    let venueDefault: String

    enum CodingKeys: String, CodingKey {
        case venueDefault
    }
}

// MARK: - OnIce
struct OnIce: Decodable {
    let playerID: Int

    enum CodingKeys: String, CodingKey {
        case playerID
    }
}

// MARK: - Clock
struct Clock: Decodable {
    let timeRemaining: String
    let secondsRemaining: Int
    let running, inIntermission: Bool
}

// MARK: - GameOutcome
struct GameOutcome: Decodable {
    let lastPeriodType: PeriodType
    let otPeriods: Int
}

enum PeriodType: String, Decodable {
    case ot = "OT"
    case reg = "REG"
}

// MARK: - PeriodDescriptor
struct PeriodDescriptor: Decodable {
    let number: Int
    let periodType: PeriodType
}

// MARK: - Play
struct Play: Decodable {
    let eventID, period: Int
    let periodDescriptor: PeriodDescriptor
    let timeInPeriod, timeRemaining, situationCode: String
    let homeTeamDefendingSide: HomeTeamDefendingSide
    let typeCode: Int
    let typeDescKey: TypeDescKey
    let sortOrder: Int
    let details: Details?

    enum CodingKeys: String, CodingKey {
        case eventID
        case period, periodDescriptor, timeInPeriod, timeRemaining, situationCode, homeTeamDefendingSide, typeCode, typeDescKey, sortOrder, details
    }
}

// MARK: - Details
struct Details: Decodable {
    let eventOwnerTeamID, losingPlayerID, winningPlayerID, xCoord: Int?
    let yCoord: Int?
    let zoneCode: ZoneCode?
    let reason: String?
    let shotType: ShotType?
    let shootingPlayerID, goalieInNetID, awaySOG, homeSOG: Int?
    let hittingPlayerID, hitteePlayerID, scoringPlayerID, scoringPlayerTotal: Int?
    let assist1PlayerID, assist1PlayerTotal, assist2PlayerID, assist2PlayerTotal: Int?
    let awayScore, homeScore, blockingPlayerID, playerID: Int?
    let secondaryReason, typeCode, descKey: String?
    let duration, committedByPlayerID, drawnByPlayerID: Int?

    enum CodingKeys: String, CodingKey {
        case eventOwnerTeamID
        case losingPlayerID
        case winningPlayerID
        case xCoord, yCoord, zoneCode, reason, shotType
        case shootingPlayerID
        case goalieInNetID
        case awaySOG, homeSOG
        case hittingPlayerID
        case hitteePlayerID
        case scoringPlayerID
        case scoringPlayerTotal
        case assist1PlayerID
        case assist1PlayerTotal
        case assist2PlayerID
        case assist2PlayerTotal, awayScore, homeScore
        case blockingPlayerID
        case playerID
        case secondaryReason, typeCode, descKey, duration
        case committedByPlayerID
        case drawnByPlayerID
    }
}

enum ShotType: String, Decodable {
    case backhand = "backhand"
    case bat = "bat"
    case deflected = "deflected"
    case slap = "slap"
    case snap = "snap"
    case tipIn = "tip-in"
    case wrapAround = "wrap-around"
    case wrist = "wrist"
}

enum ZoneCode: String, Decodable {
    case d = "D"
    case n = "N"
    case o = "O"
}

enum HomeTeamDefendingSide: String, Decodable {
    case homeTeamDefendingSideLeft = "left"
    case homeTeamDefendingSideRight = "right"
}

enum TypeDescKey: String, Decodable {
    case blockedShot = "blocked-shot"
    case delayedPenalty = "delayed-penalty"
    case faceoff = "faceoff"
    case gameEnd = "game-end"
    case giveaway = "giveaway"
    case goal = "goal"
    case hit = "hit"
    case missedShot = "missed-shot"
    case penalty = "penalty"
    case periodEnd = "period-end"
    case periodStart = "period-start"
    case shotOnGoal = "shot-on-goal"
    case stoppage = "stoppage"
    case takeaway = "takeaway"
}

// MARK: - RosterSpot
struct RosterSpot: Decodable {
    let teamID, playerID: Int
    let firstName: FirstName
    let lastName: LastName
    let sweaterNumber: Int
    let positionCode: PositionCode
    let headshot: String

    enum CodingKeys: String, CodingKey {
        case teamID
        case playerID
        case firstName, lastName, sweaterNumber, positionCode, headshot
    }
}

// MARK: - FirstName
struct FirstName: Decodable {
    let firstNameDefault: String
    let cs, fi, sk, de: String?
    let es, sv: String?

    enum CodingKeys: String, CodingKey {
        case firstNameDefault
        case cs, fi, sk, de, es, sv
    }
}

// MARK: - LastName
struct LastName: Decodable {
    let lastNameDefault: String
    let cs, fi, sk: String?

    enum CodingKeys: String, CodingKey {
        case lastNameDefault
        case cs, fi, sk
    }
}

enum PositionCode: String, Decodable {
    case c = "C"
    case d = "D"
    case g = "G"
    case l = "L"
    case r = "R"
}

// MARK: - TvBroadcast
struct TvBroadcast: Decodable {
    let id: Int
    let market, countryCode, network: String
    let sequenceNumber: Int
}
