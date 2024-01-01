//
//  ViewModel.swift
//  Bars
//
//  Created by xuchi on 2023/12/29.
//

import Foundation
import SwiftUI

@Observable
class ViewModel {
    var models : [DataModel] = getDataModels()
}

struct DataModel : Hashable, Codable, Identifiable {
    var id : Int
    var labelName : String
    var labelImage : String
    var description : String
}

func getDataModels() -> [DataModel] {
    var result : [DataModel] = []
    
    result.append(DataModel(
        id: 1,
        labelName: "Album",
        labelImage: "rectangle.stack.fill",
        description: "Album view"
    ))
    
    result.append(DataModel(
        id: 2,
        labelName: "Memories",
        labelImage: "memories",
        description: "Memories view"
    ))
    
    result.append(DataModel(
        id: 3,
        labelName: "Library",
        labelImage: "photo.on.rectangle",
        description: "Library view"
    ))
    
    result.append(DataModel(
        id: 4,
        labelName: "Panoramas",
        labelImage: "pano.fill",
        description: "Panoramas view"
    ))
    
    result.append(DataModel(
        id: 5,
        labelName: "Search",
        labelImage: "magnifyingglass",
        description: "Search view"
    ))
    
    return result
}
