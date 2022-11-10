//
//  Session.swift
//  LearningTask-6.3
//
//  Created by jeovane.barbosa on 10/11/22.
//

import Foundation


struct Session {
    var dateTime: Date
    let type: LanguageType
    let movie: Movie
    
    enum LanguageType: String {
        case subtitled = "Legendado"
        case dubbed = "Dublado"
    }
}

struct Sessions {
    var comingSessions: [Session]
    var cinema: Cinema
    
    init(_ comingSessions: [Session], by cinema: Cinema) {
        self.comingSessions = comingSessions
        self.cinema = cinema
    }
}

struct Cinema {
    let name: String
    let favorite: Bool
}
