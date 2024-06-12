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
                        .overlay(alignment: .bottom, content: {
                            HStack{
                                VStack(alignment: .leading){
                                    Text("123456 VOTE")
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .padding(.horizontal)
                                        .padding(.vertical,8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                .fill(.white)
                                        )
                                    Text("Riponvideo")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("Hi friends, I am ripon video. Video valo lagle like comment share kore pashe theko priends. Aj ei porjonto e. valo theko. Dekha hobe r akdin 7second e.")
                                        .lineLimit(3)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                
                                VStack(spacing:24){
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    Image(systemName: "message")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    Image(systemName: "paperplane")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                .foregroundColor(.white)
                                    
                            }
                            .padding()
                        })
                    
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
