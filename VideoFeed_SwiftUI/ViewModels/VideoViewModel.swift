//
//  VideoViewModel.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation
final class VideoViewModel  {
    var videos : [VideoModel]  = []
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
        videos = fetchVideoUseCase.execute()
    }
    
}
