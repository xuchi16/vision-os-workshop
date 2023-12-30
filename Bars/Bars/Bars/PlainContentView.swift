//
//  PlainContentView.swift
//  Bars
//
//  Created by xuchi on 2023/12/29.
//

import SwiftUI

struct PlainContentView: View {
    @State var barIdx = 1
    
    var body: some View {
        TabView(selection: $barIdx,
                content:  {
            Text("Tab Content 1")
                .tabItem {
                    Label("Albums", systemImage: "rectangle.stack.fill")
                }
                .tag(1)
            Text("Tab Content 2")
                .tabItem {
                    Label("Memories", systemImage: "memories")
                }
                .tag(2)
            Text("Tab Content 3")
                .tabItem {
                    Label("Library", systemImage: "photo.on.rectangle")
                }
                .tag(3)
            Text("Tab Content 4")
                .tabItem {
                    Label("Pabnoramas", systemImage: "pano.fill")
                }
                .tag(4)
            Text("Tab Content 5")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(5)
        })
        
    }
}

#Preview {
    PlainContentView()
}
