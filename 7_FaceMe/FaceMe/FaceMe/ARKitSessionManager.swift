//
//  ARKitSessionManager.swift
//  FaceMe
//
//  Created by xuchi on 2024/1/10.
//  Reference to: https://github.com/satoshi0212/visionOS_30Days/blob/main/Day16/Day16/ARKitSessionManager.swift
//

import SwiftUI
import ARKit

@MainActor
class ARKitSessionManager: ObservableObject {

    let session = ARKitSession()
    let worldTracking = WorldTrackingProvider()

    func startSession() async {
        if WorldTrackingProvider.isSupported {
            do {
                try await session.run([worldTracking])
            } catch {
                assertionFailure("Failed to run session: \(error)")
            }
        }
    }

    func getOriginFromDeviceTransform() -> simd_float4x4 {
        guard let pose = worldTracking.queryDeviceAnchor(atTimestamp: CACurrentMediaTime()) else {
            return simd_float4x4()
        }
        return pose.originFromAnchorTransform
    }
}
