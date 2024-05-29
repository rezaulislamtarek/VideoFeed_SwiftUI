//
//  FetchVideoUseCase.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation

struct FetchVideoUseCase{
    var videoRepo : VideoRepository
    
    func execute() -> [VideoModel]{
        return videoRepo.getVideos()
    }
}
