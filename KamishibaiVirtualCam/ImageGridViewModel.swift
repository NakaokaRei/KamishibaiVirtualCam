//
//  ImageGridViewModel.swift
//  KamishibaiVirtualCam
//
//  Created by rei.nakaoka on 2024/02/06.
//

import Foundation
import SwiftUI
import Cocoa

@MainActor
class ImageGridViewModel: ObservableObject {

    private let userDefaults = UserDefaults.standard
    @Published private(set) var imageUrls: [URL] = []

    let selectImageManger = SelectImageManager()

    init() {
        bind()
    }

    func selectImage() {
        selectImageManger.selectImage()
    }

    func bind() {
        selectImageManger.$imageUrls
            .receive(on: DispatchQueue.main)
            .assign(to: &$imageUrls)
    }
}
