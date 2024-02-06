//
//  ContentView.swift
//  KamishibaiVirtualCam
//
//  Created by rei.nakaoka on 2024/01/04.
//

import SwiftUI
import SystemExtensions

struct ContentView: View {

    let extensionId = "com.n.rei.KamishibaiVirtualCam.CameraExtension"
    var body: some View {
        VStack {
            buttons
            ImageGridView()
        }
    }

    var buttons: some View {
        HStack {
            Button {
                let activeRequest = OSSystemExtensionRequest.activationRequest(
                    forExtensionWithIdentifier: extensionId, queue: .main)
                OSSystemExtensionManager.shared.submitRequest(activeRequest)
            } label: {
                Text("Install")
            }
            Button {
                let deactiveRequest = OSSystemExtensionRequest.deactivationRequest(
                    forExtensionWithIdentifier: extensionId, queue: .main)
                OSSystemExtensionManager.shared.submitRequest(deactiveRequest)
            } label: {
                Text("Uninstall")
            }
        }
    }
}

#Preview {
    ContentView()
}
