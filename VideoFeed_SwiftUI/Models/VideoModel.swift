//
//  VideoModel.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import Foundation

struct VideoModel : Identifiable{
    var id : String = UUID().uuidString
    var videoTitle : String
    var url : String
    var tag : [String]
}
