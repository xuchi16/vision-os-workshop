//
//  ViewModel.swift
//  CarControl
//
//  Created by xuchi on 2024/1/15.
//

import Foundation
import RealityKit

@Observable
class ViewModel {
    var forward = false
    var backward = false
    var left = false
    var right = false
    
    func reset() {
        forward = false
        backward = false
        left = false
        right = false
    }
}
