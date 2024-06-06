//
//  CustomVideoPlayer.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 4/6/24.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer
    
    func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        player.actionAtItemEnd = .none
         
        NotificationCenter.default.addObserver(
                    context.coordinator,
                    selector: #selector(context.coordinator.playerItemDidReachEnd),
                    name: .AVPlayerItemDidPlayToEndTime,
                    object: player.currentItem
                )
    
         return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject {
            var parent: CustomVideoPlayer

            init(_ parent: CustomVideoPlayer) {
                self.parent = parent
            }

            @objc func playerItemDidReachEnd(notification: NSNotification) {
                parent.player.seek(to: .zero)
                parent.player.play()
            }
        }

        static func dismantleUIViewController(_ uiViewController: AVPlayerViewController, coordinator: Coordinator) {
            NotificationCenter.default.removeObserver(coordinator, name: .AVPlayerItemDidPlayToEndTime, object: uiViewController.player?.currentItem)
        }
     
}

 
