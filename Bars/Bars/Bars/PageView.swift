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
                } label: {
                    Label("Recent", systemImage: "clock")
                }
                NavigationLink {
                } label: {
                    Label("Favorite", systemImage: "suit.heart")
                }
            }
            .navigationTitle(dataModel.labelName)
        } detail: {
            Text(dataModel.description)
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    return PageView(dataModel : viewModel.models[0])
}
