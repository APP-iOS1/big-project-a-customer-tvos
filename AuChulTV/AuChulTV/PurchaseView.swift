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
        Image(uiImage: generateQRCode(from: "\(target.NotebookTitles)"))
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
