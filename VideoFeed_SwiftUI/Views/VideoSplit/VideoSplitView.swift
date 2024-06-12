//
//  VideoSplitView.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 6/6/24.
//

import SwiftUI
import AVKit

struct VideoSplitView: View {
    @StateObject private var viewModel = VideoSplitViewModel()
    @State private var videoURL: URL? = nil
    @State private var exportedURLs: [URL] = []
    
    var body: some View {
        VStack {
            if let videoURL = videoURL {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(height: 300)
                
                Button("Split Video") {
                    let segments: [(CMTime, CMTime)] = [
                        (CMTime(seconds: 0, preferredTimescale: 600), CMTime(seconds: 7, preferredTimescale: 600)),
                        (CMTime(seconds: 7, preferredTimescale: 600), CMTime(seconds: 14, preferredTimescale: 600))
                    ]
                    viewModel.splitVideo(url: videoURL, segments: segments) { result in
                        switch result {
                        case .success(let urls):
                            self.exportedURLs = urls
                        case .failure(let error):
                            print("Error splitting video: \(error)")
                        }
                    }
                }
            }
            
            if !exportedURLs.isEmpty {
                Text("Exported Segments:")
                ForEach(exportedURLs, id: \.self) { url in
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: 150)
                }
            }
        }
        .onAppear {
            // Load your video URL here
            videoURL = URL(string: "https://embed-ssl.wistia.com/deliveries/cc8402e8c16cc8f36d3f63bd29eb82f99f4b5f88/accudvh5jy.mp4")
        }
    }
}

struct VideoSplitView_Previews: PreviewProvider {
    static var previews: some View {
        VideoSplitView()
    }
}
