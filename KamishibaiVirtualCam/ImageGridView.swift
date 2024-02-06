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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(viewModel.imageUrls, id: \.self) { url in
                Button {
                    Defaults[.selectedImageUrl] = url
                    print(Defaults[.selectedImageUrl])
                } label: {
                    Image(nsImage: NSImage(contentsOf: url)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ImageGridView()
}
