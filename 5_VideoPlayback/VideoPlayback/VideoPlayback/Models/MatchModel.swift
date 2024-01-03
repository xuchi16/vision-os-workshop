//
//  MatchModel.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/3.
//

import Foundation

struct MatchModel: Identifiable, Hashable, Codable {
    let id: Int
    let video: Video
    let home: MatchTeam
    let away: MatchTeam
    
    func getTitle() -> String {
        return "\(home.name) vs \(away.name)"
    }
    
    func getStatsTitle() -> [String] {
        return ["Possession", "Shots", "Fouls", "Cards", "Offsides", "Corners"]
    }
}

struct MatchTeam: Hashable, Codable {
    // Team info
    let name: String
    let logoPath: String
    let lineup: [String]
    
    // Stats
    let posession: Double
    let shots: Int
    let fouls: Int
    let cards: Int
    let offsides: Int
    let corners: Int
    
    func getStats() -> [String] {
        var result: [String] = []
        result.append(String(format: "%.0f%", posession * 100))
        result.append(String(shots))
        result.append(String(fouls))
        result.append(String(cards))
        result.append(String(offsides))
        result.append(String(corners))
        
        return result
    }
}
