//
//  GestureView.swift
//  ObjectMovement
//
//  Created by xuchi on 2024/1/8.
//

import SwiftUI
import RealityKit

struct MovementView: View {
    
    private let radius: Float = 0.2
    private let attachmentOffset: SIMD3<Float> = [0, -0.3, 0]
    private let attachmentFontSize = 50.0
    private let attachmentPadding = 40.0
    
    @State var dragEntity = Entity()
    @State var programmaticEntity = Entity()
    @Environment(ViewModel.self) var model;

    var dragGesture: some Gesture {
        DragGesture()
            .targetedToAnyEntity()
            .onChanged{ value in
                dragEntity.position = value.convert(value.location3D, from: .local, to: dragEntity.parent!)
            }
    }
    var body: some View {
        RealityView { content, attachments in
            // Programmatic movement
            MoveComponent.registerComponent()
            MoveSystem.registerSystem()
            
            let initPosition = SIMD3<Float>(x: -0.6, y: 1.5, z: -2)
            var moveComponent = MoveComponent(position: initPosition)
            moveComponent.movementEnabled = {model.enableMovement}
            programmaticEntity = ModelEntity(
                mesh: .generateSphere(radius: radius),
                materials: [SimpleMaterial(color: .red, isMetallic: false)]
            )
            programmaticEntity.position = initPosition
            programmaticEntity.components[MoveComponent.self] = moveComponent
            content.add(programmaticEntity)
            
            if let attachment = attachments.entity(for: "progMove") {
                attachment.position = attachmentOffset
                programmaticEntity.addChild(attachment)
            }
            
            // Drag movement
            dragEntity = ModelEntity(
                mesh: .generateSphere(radius: radius),
                materials: [SimpleMaterial(color: .blue, isMetallic: false)],
                collisionShape: .generateBox(size: SIMD3<Float>(repeating: radius)),
                mass: 0.0
            )
            dragEntity.position = SIMD3(x: 0.6, y: 1.5, z: -2)
            dragEntity.components.set(InputTargetComponent(allowedInputTypes: .indirect))
            content.add(dragEntity)
            
            if let attachment = attachments.entity(for: "dragMove") {
                attachment.position = attachmentOffset
                dragEntity.addChild(attachment)
            }
            
        } attachments: {
            Attachment(id: "progMove") {
                Text("Programmatic Movement")
                    .font(.system(size: attachmentFontSize))
                    .padding(attachmentPadding)
                    .glassBackgroundEffect()
            }
            Attachment(id: "dragMove") {
                Text("Drag Movement")
                    .font(.system(size: attachmentFontSize))
                    .padding(attachmentPadding)
                    .glassBackgroundEffect()
            }
        }
        .gesture(dragGesture)
    }
}

#Preview {
    MovementView()
}
