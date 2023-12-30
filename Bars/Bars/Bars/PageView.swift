//
//  PageView.swift
//  Bars
//
//  Created by xuchi on 2023/12/30.
//

import SwiftUI

struct PageView: View {
    var dataModel : DataModel
    
    var body: some View {
        NavigationSplitView() {
            List {
                NavigationLink {
                    Text(dataModel.description)
                    Text("Recent view")
                } label: {
                    Label("Recent", systemImage: "clock")
                }
                NavigationLink {
                    Text(dataModel.description)
                    Text("Favorite view")
                } label: {
                    Label("Favorite", systemImage: "suit.heart")
                }
            }
            .navigationTitle(dataModel.labelName)
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    return PageView(dataModel : viewModel.models[0])
}
