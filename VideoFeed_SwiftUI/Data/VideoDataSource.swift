//
//  File.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation
  
protocol VideoDataSource{
    func fetchVideos() -> [VideoModel]
    func uploadVideo(video : VideoModel) -> Bool
    func removeVideo(videoId: String) -> Bool
}

class VideDataSourceImpl : VideoDataSource{
    
    private var videos : [VideoModel] = []
    
    init(){
        initVideos()
    }
    
    func uploadVideo(video: VideoModel) -> Bool {
        videos.append(video)
        return true
    }
    
    func removeVideo(videoId: String) -> Bool {
        if let removedVideoIndex = videos.firstIndex(where: { $0.id == videoId }){
            videos.remove(at: removedVideoIndex)
            return true
        }
        return false
    }
    
    func fetchVideos() -> [VideoModel] {
        return videos
    }
    
    func initVideos(){
        videos = [
            VideoModel(videoTitle: "Flower", url: "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4", tag: ["Animation","Child"]),
            VideoModel(videoTitle: "trailer", url: "https://media.w3.org/2010/05/sintel/trailer.mp4", tag: ["Animation","Child"]),
            VideoModel(videoTitle: "For Bigger Blazes", url: "https://embed-ssl.wistia.com/deliveries/cc8402e8c16cc8f36d3f63bd29eb82f99f4b5f88/accudvh5jy.mp4", tag: ["Animation","Child","For Bigger Blazes"]),
           
            VideoModel(videoTitle: "Elephants Dream", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4", tag: ["Animation","Child","Elephants Dream"]),
            VideoModel(videoTitle: "Big Buck Bunny", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", tag: ["Animation","Child"]),
            VideoModel(videoTitle: "Elephants Dream", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4", tag: ["Animation","Child","Elephants Dream"]),
            VideoModel(videoTitle: "For Bigger Blazes", url: "https://embed-ssl.wistia.com/deliveries/cc8402e8c16cc8f36d3f63bd29eb82f99f4b5f88/accudvh5jy.mp4", tag: ["Animation","Child","For Bigger Blazes"]),
            VideoModel(videoTitle: "Big Buck Bunny", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", tag: ["Animation","Child"]),
            VideoModel(videoTitle: "Elephants Dream", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4", tag: ["Animation","Child","Elephants Dream"]),
            VideoModel(videoTitle: "For Bigger Blazes", url: "https://embed-ssl.wistia.com/deliveries/cc8402e8c16cc8f36d3f63bd29eb82f99f4b5f88/accudvh5jy.mp4", tag: ["Animation","Child","For Bigger Blazes"]),
        ]
    }
    
}
