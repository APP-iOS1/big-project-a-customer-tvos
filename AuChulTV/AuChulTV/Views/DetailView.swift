//
//  DetailView.swift
//  AuChulTV
//
//  Created by tae on 2023/01/02.
//

import SwiftUI
import AVKit
import CoreImage.CIFilterBuiltins

struct DetailView: View {
    @Binding var product: ItemInfo
    var player = AVPlayer(url: URL(string: "https://swiftanytime-content.s3.ap-south-1.amazonaws.com/SwiftUI-Beginner/Video-Player/iMacAdvertisement.mp4")!)
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    var body: some View {
        HStack {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .onAppear {
                    addObserver() // 1
                    player.play() // 5
                }
                .onDisappear {
                    removeObserver() // 2
                }
            VStack {
                Text("\(product.itemName)")
                    .font(.title)
                Text("\(Int(product.price)) 원")
                    .font(.subheadline)
                    .padding(.bottom, 20)
                Text("아래 QR을 인식하면 구매 가능한 모바일 앱으로 이동합니다.")
                    .font(.subheadline)
                Image(uiImage: UIImage(data: getQRCodeDate(text: product.itemName)!)!)
                    .resizable()
                    .frame(width: 300, height: 300)
            }

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
    
    func getQRCodeDate(text: String) -> Data? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let data = text.data(using: .ascii, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}

