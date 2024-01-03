//
//  MockData.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/3.
//

import Foundation

func getMatchData() -> MatchModel {
    let video = getVideo()
    let home = MatchTeam(name: "Fulham",
                         logoPath: "Fulham",
                         lineup: ["14. Bobby Reid",
                                  "17. Alex Iwobi",
                                  "19. Rodrigo Muniz",
                                  "10. Tom Cairney",
                                  "18. Andreas Pereira",
                                  "26. João Palhinha",
                                  "2.  Kenny Tete",
                                  "4.  Tosin Adarabioyo",
                                  "33. Antonee Robinson",
                                  "3.  Calvin Ughelumba",
                                  "17. Bernd Leno",
                                 ],
                         posession: 0.39,
                         shots: 10,
                         fouls: 11,
                         cards: 4,
                         offsides: 4,
                         corners: 5)
    let away = MatchTeam(name: "Arsenal",
                         logoPath: "Arsenal",
                         lineup: ["9.  Gabriel Jesus",
                                  "11. Gabriel Martinelli",
                                  "35. Oleksandr Zinchenko",
                                  "8.  Martin Ødegaard",
                                  "41. Declan Rice",
                                  "29. Kai Havertz",
                                  "7.  Bukayo Saka",
                                  "6.  Gabriel Magalhães",
                                  "4.  Ben White",
                                  "2.  William Saliba",
                                  "22. David Raya",
                                 ],
                         posession: 0.61,
                         shots: 11,
                         fouls: 10,
                         cards: 1,
                         offsides: 0,
                         corners: 4)
    return MatchModel(id: 1, video: video, home: home, away: away)
}

func getVideo() -> Video {
    return Video(id:1,
                 url: URL(string: "https://vodapp.duoduocdn.com/4a8d9c67vodtransgzp1251542705/bf9a02593270835014467115326/v.f100820.mp4")!,
                 eventTimesInSecond: [17, 128, 238])
}
