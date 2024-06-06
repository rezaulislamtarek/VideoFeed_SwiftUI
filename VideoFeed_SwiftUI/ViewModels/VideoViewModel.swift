//
//  VideoViewModel.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation
import AVFoundation

final class VideoViewModel  {
    var videos : [VideoPlayerModel]  = []
    private var fetchVideoUseCase : FetchVideoUseCase
    private var uploadVideoUseCase : UploadVideoUseCase
    private var removeVideoUseCase : RemoveVideoUseCase
    
    init( fetchVideoUseCase: FetchVideoUseCase, uploadVideoUseCase: UploadVideoUseCase, removeVideoUseCase: RemoveVideoUseCase) {
        self.fetchVideoUseCase = fetchVideoUseCase
        self.uploadVideoUseCase = uploadVideoUseCase
        self.removeVideoUseCase = removeVideoUseCase
        
        fetchVideos()
    }
    
    private func fetchVideos(){
       videos = fetchVideoUseCase.execute().map { toVideoPlayerModel(videoModel: $0) }
    }
    
    private func toVideoPlayerModel(videoModel : VideoModel) -> VideoPlayerModel{
        return VideoPlayerModel(player: AVPlayer(url: URL(string: videoModel.url)!))
    }
    
}
