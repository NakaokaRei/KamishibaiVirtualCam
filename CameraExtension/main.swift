//
//  main.swift
//  CameraExtension
//
//  Created by rei.nakaoka on 2024/01/04.
//

import Foundation
import CoreMediaIO

let providerSource = ExtensionProviderSource(clientQueue: nil)
CMIOExtensionProvider.startService(provider: providerSource.provider)

CFRunLoopRun()
