//
//  Movie.swift
//  LearningTask-6.3
//
//  Created by rafael.rollo on 15/04/2022.
//

import Foundation

enum MovieRating: String, RawRepresentable {
    case free = "L"
    case notRecommendedUnder10 = "10"
    case notRecommendedUnder12 = "12"
    case notRecommendedUnder14 = "14"
    case notRecommendedUnder16 = "16"
    case notRecommendedUnder18 = "18"
}

struct Movie {
    let backgroundImage: String
    let posterImage: String
    let title: String
    let rating: MovieRating
    let duration: TimeInterval
    let criticsScore: Int
    let publicScore: Int
}
