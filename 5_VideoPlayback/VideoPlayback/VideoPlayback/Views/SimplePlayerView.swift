//
//  SimplePlayerView.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/3.
//

import SwiftUI
import AVFoundation
import AVKit

struct SimplePlayerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = AVPlayer()
        controller.player?.replaceCurrentItem(with:AVPlayerItem(url: URL(string: "https://vodapp.duoduocdn.com/4a8d9c67vodtransgzp1251542705/bf9a02593270835014467115326/v.f100820.mp4")!))
        return controller
    }
    
    func updateUIViewController(_:AVPlayerViewController,context:Context){
    }
}

#Preview {
    SimplePlayerView()
}
