//
//  Defaults+Keys.swift
//  KamishibaiVirtualCam
//
//  Created by rei.nakaoka on 2024/02/06.
//

import Foundation
import Defaults

let suiteName = UserDefaults(suiteName: "7ZJJ7KR6WA.com.n.rei.KamishibaiVirtualCam")!

extension Defaults.Keys {
    public static let selectedBase64Image = Key<String>("selectedBase64Image", default: "", suite: suiteName)
}
