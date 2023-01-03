//
//  PurchaseView.swift
//  AuChulTV
//
//  Created by tae on 2023/01/02.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct PurchaseView: View {
    @Binding var target: NotebookItem
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    var body: some View {
        VStack {
            
            Text("\(target.NotebookTitles)에 관심이 있으신가요?")
                .font(.title3)
                .bold()
            Text("아래 QR을 인식하면 구매 가능한 모바일 앱으로 이동합니다.")
                .font(.subheadline)
            Image(uiImage: UIImage(data: getQRCodeDate(text: target.NotebookTitles)!)!)
                .resizable()
                .frame(width: 600, height: 600)
        }
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
