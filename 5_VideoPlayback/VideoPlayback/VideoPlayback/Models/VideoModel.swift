//
//  ViewModel.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/2.
//

import Foundation
import AVFoundation
import AVKit
import SwiftUI


struct Video: Identifiable, Hashable, Codable {
    let id: Int
    let url: URL
    let eventTimesInSecond: [Double]
    
    func getEventTimes() -> [NSValue] {
        var result: [NSValue] = []
        for eventTime in eventTimesInSecond {
            result.append(NSValue(time: CMTime(seconds: eventTime, preferredTimescale: 1)))
            result.append(NSValue(time: CMTime(seconds: eventTime + 8, preferredTimescale: 1)))
        }
        return result
    }
    
    func getEventTimesVal() -> [CMTime] {
        var result: [CMTime] = []
        for eventTime in eventTimesInSecond {
            result.append(CMTime(seconds: eventTime, preferredTimescale: 1))
        }
        return result
    }
    
}
