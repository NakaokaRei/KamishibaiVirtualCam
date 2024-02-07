//
//  ImageGridView.swift
//  KamishibaiVirtualCam
//
//  Created by rei.nakaoka on 2024/02/06.
//

import SwiftUI
import Defaults

struct ImageGridView: View {

    @StateObject private var viewModel = ImageGridViewModel()

    var body: some View {
        VStack {
            selectImageButton
            gridView
        }
    }

    var selectImageButton: some View {
        Button("Select Image") {
            viewModel.selectImage()
        }
    }

    var gridView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(viewModel.imageUrls, id: \.self) { url in
                    Button {
                        if let image = NSImage(contentsOf: url) {
                            guard let tiffRepresentation = image.tiffRepresentation,
                                  let bitmapImage = NSBitmapImageRep(data: tiffRepresentation),
                                  let imageData = bitmapImage.representation(using: .jpeg, properties: [:]) else {
                                return
                            }
                            // DataオブジェクトをBase64エンコードされた文字列に変換
                            let base64Image = imageData.base64EncodedString()
                            Defaults[.selectedBase64Image] = url.absoluteString
                        }
                    } label: {
                        Image(nsImage: NSImage(contentsOf: url)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ImageGridView()
}
