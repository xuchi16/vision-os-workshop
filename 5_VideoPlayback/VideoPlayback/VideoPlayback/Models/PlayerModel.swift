//
//  PlayerModel.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/2.
//

import Foundation
import AVFoundation
import AVKit

@Observable
class PlayerModel {
    public var goal = false

    private var player = AVPlayer()
    private var item: AVPlayerItem?
    private var timeObserverToken: Any? = nil
    private var currentVideo: Video? = nil
    
    init() {
    }
    
    func load(_ video: Video) {
        currentVideo = video
        item = AVPlayerItem(url: video.url)
        player.replaceCurrentItem(with: item)

        // Register callback
        let times = video.getEventTimes()
        _ = player.addBoundaryTimeObserver(forTimes: times, queue: .main) {
            self.markerReachedAction()
        }
        
        // Interstitials
        let interstitialController = AVPlayerInterstitialEventController(primaryPlayer: player)
        var interstitialEvents: [AVPlayerInterstitialEvent] = []
        if let times = currentVideo?.getEventTimesVal() {
            for time in times {
                interstitialEvents.append(AVPlayerInterstitialEvent(primaryItem: item!, time: time))
            }
        }
        interstitialController.events = interstitialEvents
    }
    
    
    func genViewController() -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        return controller
    }
    
    func markerReachedAction() {
        goal = !goal
    }

}

