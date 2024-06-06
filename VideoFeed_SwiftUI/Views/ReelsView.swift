//
//  ReelsView.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 4/6/24.
//

import SwiftUI

struct ReelsView: View {
    @State var currentReel = ""
    var vm : VideoViewModel
    @State var videos : [VideoPlayerModel]
    
    init(){
        let videoDataSource : VideoDataSource = VideDataSourceImpl()
        let videoRepo = VideoRepositoryImpl(videoDataSource: videoDataSource)
        let fetchVideoUseCase = FetchVideoUseCase(videoRepo: videoRepo)
        let uploadVideoUseCase = UploadVideoUseCase(videoRepo: videoRepo)
        let removeVideoUseCase = RemoveVideoUseCase(videoRepo: videoRepo)
        
        vm = VideoViewModel(fetchVideoUseCase: fetchVideoUseCase, uploadVideoUseCase: uploadVideoUseCase, removeVideoUseCase: removeVideoUseCase)
        videos = vm.videos
        print(vm.videos.count)
    }
    
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            
            TabView(selection: $currentReel){
                ForEach($videos){ media in
                    ReelsPlayer(media: media, currentReel: $currentReel)
                    .frame(width:size.width)
                    .rotationEffect(.init(degrees: -90))
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(media.id)
                }
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear{
            currentReel = videos.first?.id ?? ""
        }
    }
}

#Preview {
    ReelsView()
}


struct ReelsPlayer : View {
    @Binding var media: VideoPlayerModel
    @Binding var currentReel : String
    var body: some View {  
        ZStack{
            if let player = media.player{
                CustomVideoPlayer(player: player)
                GeometryReader{ proxy -> Color in
                    let minY = proxy.frame(in: .global).minY
                    let size = proxy.size
                    
                    Task{
                        DispatchQueue.global().async {
                            if -minY < ( size.height / 2 ) && minY < (size.height/2) && currentReel == media.id {
                                player.play()
                            }else{
                                player.pause()
                            }
                        }
                    }
                    return Color.clear
                }
                
            }
        }
     }
    
}
