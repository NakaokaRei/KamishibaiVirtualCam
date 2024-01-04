//
//  main.swift
//  CameraExtension
//
//  Created by rei.nakaoka on 2024/01/04.
//

import Foundation
import CoreMediaIO

let providerSource = CameraExtensionProviderSource(clientQueue: nil)
CMIOExtensionProvider.startService(provider: providerSource.provider)

CFRunLoopRun()
