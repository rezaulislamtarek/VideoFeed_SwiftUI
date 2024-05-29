//
//  RemoveVideoUseCase.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation
struct RemoveVideoUseCase{
    var videoRepo : VideoRepository
    func execute(videoId : String) ->Bool{
        videoRepo.removeVideo(videoId: videoId)
    }
}
