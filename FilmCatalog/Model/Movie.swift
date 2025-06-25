//
//  FilmModel.swift
//  FilmCatalog
//
//  Created by Dmitrii Nazarov on 25.06.2025.
//

import Foundation

struct Movie: Identifiable, Codable {
    var id: Int
    let alternativeName: String?
    let description: String?
    let year: Int?
    let poster: Poster?

}

struct Poster: Codable {
    let url: String?
}

//extension Movie {
//    static let mockList: [Movie] = [
//        .init(id: 6778, alternativeName: "hi", description: "some", year: 2020, poster: Poster(
//            url: "https://via.placeholder.com/300x450"
//        )),
//        .init(id: 7547, alternativeName: "hjjhhi", description: "jkhbh", year: 2020, poster: Poster(
//            url: "https://via.placeholder.com/300x450"
//        )),
//       
//    ]
//}
