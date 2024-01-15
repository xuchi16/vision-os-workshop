//
//  GameControllerManager.swift
//  CarControl
//
//  Created by xuchi on 2024/1/15.
//

import Foundation
import GameController

class GameControllerManager: ObservableObject {
    
    private var model: ViewModel?
    private var sensitivity: Float = 0.6
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(controllerConnected(notification:)), name: .GCControllerDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(controllerDisconnected(notification:)), name: .GCControllerDidDisconnect, object: nil)
        
        GCController.startWirelessControllerDiscovery {}
    }
    
    @objc func controllerConnected(notification: Notification) {
        print("Connected!")
        // Configure controller
        if let controller = notification.object as? GCController {
            configureController(controller)
        }
    }
    
    @objc func controllerDisconnected(notification: Notification) {
        print("Disconnected")
    }
    
    func configureController(_ controller: GCController) {
        if let gamepad = controller.extendedGamepad {
            gamepad.valueChangedHandler = { [weak self] (gamepad: GCExtendedGamepad, element: GCControllerElement) in
                self?.handleGamepadInput(gamepad)
            }
        }
    }
    
    func handleGamepadInput(_ gamepad: GCExtendedGamepad) {
        let leftThumbstickX = gamepad.leftThumbstick.xAxis.value
        let leftThumbstickY = gamepad.leftThumbstick.yAxis.value
        
        if model == nil {
            return
        }
        
        if leftThumbstickX != 0 || leftThumbstickY != 0 {
            print("Left Thumbstick Moved: \(leftThumbstickX), \(leftThumbstickY)")
            if leftThumbstickX < -sensitivity {
                model?.left = true
            }
            if leftThumbstickX > sensitivity {
                model?.right = true
            }
            if leftThumbstickY > sensitivity {
                model?.forward = true
            }
            if leftThumbstickY < -sensitivity {
                model?.backward = true
            }
            
        } else {
            model?.reset()
            print("Left Thumbstick Released")
        }
    }
    
    func register(model: ViewModel) {
        self.model = model
    }
}
