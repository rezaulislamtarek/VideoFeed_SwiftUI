//
//  ContentView.swift
//  VideoFeed_SwiftUI
//
//  Created by Rezaul Islam on 29/5/24.
//

import SwiftUI

struct VideoFeedScreen: View {
    
    var vm : VideoViewModel
    
    init(){
         
        let videoDataSource : VideoDataSource = VideDataSourceImpl()
        let videoRepo = VideoRepositoryImpl(videoDataSource: videoDataSource)
        let fetchVideoUseCase = FetchVideoUseCase(videoRepo: videoRepo)
        let uploadVideoUseCase = UploadVideoUseCase(videoRepo: videoRepo)
        let removeVideoUseCase = RemoveVideoUseCase(videoRepo: videoRepo)
        
        vm = VideoViewModel(fetchVideoUseCase: fetchVideoUseCase, uploadVideoUseCase: uploadVideoUseCase, removeVideoUseCase: removeVideoUseCase) 
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("Video Feed")
                .bold()
                .padding()
            ScrollView(showsIndicators: false){
                LazyVStack(spacing:8 ){
                    ForEach(vm.videos){ video in
                        FeedItemView(video: video)
                            .padding(.bottom)
                             
                    }
                }
            }
        }
        .background(.gray.opacity(0.1))
         
    }
}

#Preview {
    VideoFeedScreen()
}
