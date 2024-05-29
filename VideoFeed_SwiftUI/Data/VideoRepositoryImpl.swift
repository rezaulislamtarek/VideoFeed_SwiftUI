//
//  VideoRepositoryImpl.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation

struct VideoRepositoryImpl : VideoRepository{
    
    var videoDataSource : VideoDataSource
    
    func getVideos() -> [VideoModel] {
        return videoDataSource.fetchVideos()
    }
    
    func uploadVideo(video: VideoModel) -> Bool {
        videoDataSource.uploadVideo(video: video)
        
    }
    
    func removeVideo(videoId: String) -> Bool {
        videoDataSource.removeVideo(videoId: videoId)
    }
    
    
}
