//
//  LineupView.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/3.
//

import SwiftUI

struct LineupView: View {
    var match: MatchModel

    
    var body: some View {
        let home = match.home
        let away = match.away
        VStack {
            HStack {
                Text("Lineup")
                    .font(.title)
                    .bold()
            }
            .padding()
            Divider()
            
            HStack {
                HStack {
                    Image(home.logoPath)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text(home.name).bold()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
                
                HStack {
                    Image(away.logoPath)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text(away.name).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Divider()
            
            ForEach(0..<home.lineup.count, id: \.self) { index in
                HStack {
                    Text(home.lineup[index])
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Divider()
                    Text(away.lineup[index])
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    LineupView(match:getMatchData())
}
