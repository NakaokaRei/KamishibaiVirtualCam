//
//  Defaults+Keys.swift
//  KamishibaiVirtualCam
//
//  Created by rei.nakaoka on 2024/02/06.
//

import Foundation
import Defaults

extension Defaults.Keys {
    public static let selectedImageUrl = Key<URL>("selectedImageUrl", default: URL(fileURLWithPath: ""))
}
