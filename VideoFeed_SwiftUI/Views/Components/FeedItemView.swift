//
//  FeedItemView.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import SwiftUI
import AVKit

struct FeedItemView: View {
    var video : VideoModel
    
    @State private var player : AVPlayer
    
    init(video : VideoModel){
        self.video = video
        player =  AVPlayer(url: URL(string: self.video.url)!)
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 4){
            VideoPlayer(player: player)
                .frame(height: 220)
            
            
            Text(video.videoTitle)
                .padding(.horizontal)
            HStack{
                ForEach(video.tag, id: \.self){ tag in
                    Text(tag)
                        .font(.footnote)
                        .padding(.horizontal)
                        .padding(.vertical,4)
                        .background(.green.opacity(0.1))
                        .cornerRadius(16)
                }
            }.padding(.horizontal)
        }
        .onAppear{
            player.play()
            //player.isMuted = true
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [])
            }
            catch {
                print("Setting category to AVAudioSessionCategoryPlayback failed.")
            }
        }
    }
}

#Preview {
    FeedItemView(video: VideoModel(videoTitle: "Video", url: "https://embed-ssl.wistia.com/deliveries/cc8402e8c16cc8f36d3f63bd29eb82f99f4b5f88/accudvh5jy.mp4", tag: ["Test Tag One","Tag 2", "Tag Three"]))
}
