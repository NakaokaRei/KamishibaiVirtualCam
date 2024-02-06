//
//  SelectImageManager.swift
//  KamishibaiVirtualCam
//
//  Created by rei.nakaoka on 2024/02/06.
//

import Foundation
import Cocoa
import Combine

class SelectImageManager {

    @Published private(set) var imageUrls: [URL] = []

    func selectImage() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.image]
        panel.allowsMultipleSelection = true

        if panel.runModal() == .OK {
            imageUrls = panel.urls
        }
    }

    func resetImages() {
        imageUrls = []
    }
}
