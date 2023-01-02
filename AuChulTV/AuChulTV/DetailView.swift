//
//  DetailView.swift
//  AuChulTV
//
//  Created by tae on 2023/01/02.
//

import SwiftUI
import AVKit

struct DetailView: View {
    var player = AVPlayer(url: URL(string: "https://swiftanytime-content.s3.ap-south-1.amazonaws.com/SwiftUI-Beginner/Video-Player/iMacAdvertisement.mp4")!)
    
    var body: some View {
        VideoPlayer(player: player)
            .frame(width: .infinity, height: .infinity, alignment: .center)
            .onAppear {
                addObserver() // 1
            }
            .onDisappear {
                removeObserver() // 2
            }
    }
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem,
                                               queue: nil) { notif in // 3
            player.seek(to: .zero) // 4
            player.play() // 5
        }
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self,  // 6
                                                  name: .AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
