//
//  PlayModel.swift
//  VideoMaterial
//
//  Created by xuchi on 2024/2/1.
//

import Foundation
import AVFoundation
import AVKit
import Combine

class PlayModel: ObservableObject {
    var player = AVPlayer()
    var item: AVPlayerItem?
    
    private var subscriptions = Set<AnyCancellable>()
    @Published var isPlaying: Bool = false
    
    init() {
        observePlayer()
    }
    
    func load(_ url: URL) {
        item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
    }
    
    func togglePlayPause() {
        if player.rate == 0 {
            player.play()
        } else {
            player.pause()
        }
    }
    
    private func observePlayer() {
        player.publisher(for: \.timeControlStatus)
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] status in
                switch status {
                case .playing:
                    self?.isPlaying = true
                default:
                    self?.isPlaying = false
                }
            })
            .store(in: &subscriptions)
    }
}
