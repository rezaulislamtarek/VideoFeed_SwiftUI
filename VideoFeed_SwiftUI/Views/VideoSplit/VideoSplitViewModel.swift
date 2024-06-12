//
//  VideoSplitViewModel.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 6/6/24.
//

import SwiftUI
import AVFoundation

class VideoSplitViewModel: ObservableObject {
    @Published var exportProgress: Double = 0.0
    
    func splitVideo(url: URL, segments: [(start: CMTime, end: CMTime)], completion: @escaping (Result<[URL], Error>) -> Void) {
        let asset = AVAsset(url: url)
        var exportedURLs: [URL] = []
        let dispatchGroup = DispatchGroup()

        for (index, segment) in segments.enumerated() {
            dispatchGroup.enter()
            let outputURL = FileManager.default.temporaryDirectory.appendingPathComponent("segment\(index).mp4")
            
            if let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality) {
                exportSession.outputURL = outputURL
                exportSession.outputFileType = .mp4
                exportSession.timeRange = CMTimeRange(start: segment.start, end: segment.end)
                
                exportSession.exportAsynchronously {
                    switch exportSession.status {
                    case .completed:
                        exportedURLs.append(outputURL)
                        dispatchGroup.leave()
                    case .failed, .cancelled:
                        if let error = exportSession.error {
                            completion(.failure(error))
                            dispatchGroup.leave()
                        }
                    default:
                        break
                    }
                }
            }
        }

        dispatchGroup.notify(queue: .main) {
            completion(.success(exportedURLs))
        }
    }
}
