//
//  VideoRepository.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation

protocol VideoRepository{
    func getVideos() -> [VideoModel]
    func uploadVideo(video : VideoModel) -> Bool
    func removeVideo(videoId : String) -> Bool
}
