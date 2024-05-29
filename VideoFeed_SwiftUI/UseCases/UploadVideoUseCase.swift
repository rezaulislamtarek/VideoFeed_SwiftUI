//
//  UploadVideoUseCase.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation

struct UploadVideoUseCase{
    var videoRepo : VideoRepository
    func execute(video : VideoModel) -> Bool{
        return videoRepo.uploadVideo(video: video)
    }
}
