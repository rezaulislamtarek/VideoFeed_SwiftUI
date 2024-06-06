//
//  VideoPlayerModel.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 4/6/24.
//

import Foundation
import AVFoundation

struct VideoPlayerModel : Identifiable, Hashable{
    var id = UUID().uuidString
    var player : AVPlayer?
    
}
