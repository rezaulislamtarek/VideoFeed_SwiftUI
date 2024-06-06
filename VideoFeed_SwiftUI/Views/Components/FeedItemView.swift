//
//  FeedItemView.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import SwiftUI
import AVKit


//
//struct FeedItemView: View {
//    var video : VideoPlayerModel
//    
//    var vm : VideoViewModel
//    
//    init(){
//         
//        let videoDataSource : VideoDataSource = VideDataSourceImpl()
//        let videoRepo = VideoRepositoryImpl(videoDataSource: videoDataSource)
//        let fetchVideoUseCase = FetchVideoUseCase(videoRepo: videoRepo)
//        let uploadVideoUseCase = UploadVideoUseCase(videoRepo: videoRepo)
//        let removeVideoUseCase = RemoveVideoUseCase(videoRepo: videoRepo)
//        
//        vm = VideoViewModel(fetchVideoUseCase: fetchVideoUseCase, uploadVideoUseCase: uploadVideoUseCase, removeVideoUseCase: removeVideoUseCase)
//    }
//     
//    
//    var body: some View {
//        VStack(alignment:.leading, spacing: 4){
//            VideoPlayer(player: video.player)
//                .scaledToFill()
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                .overlay(alignment: .bottom) {
//                    VStack{
//                        Text("Title")
//                            .foregroundColor(.white)
//                            .font(.title)
//                            .padding(.horizontal)
// 
//                    }
//                }
//        }
//        .onAppear{
//            print("Video onAppear \(video.id)")
//            
//            do {
//                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [])
//            }
//            catch {
//                
//            }
//        }
//        .onDisappear{
//            print("Video disAppear")
//            
//        }
//    }
//}
//
////#Preview {
////    FeedItemView(video: VideoPlayerModel(id: "as", player: AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4")!)))
////}
