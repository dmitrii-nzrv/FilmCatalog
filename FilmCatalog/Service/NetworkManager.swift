//
//  NetworkManager.swift
//  FilmCatalog
//
//  Created by Dmitrii Nazarov on 24.06.2025.
//

import SwiftUI

class NetworkManager {
    
    func getMovie() async throws -> Movie{
        guard let url = URL(string: "https://api.kinopoisk.dev/v1.4/movie/random") else { throw MovieError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "X-API-KEY": "RV55A33-EKT4JBD-HKH35Y2-4GQXT9B"
        ]

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw MovieError.invalidResponse }
        
        do  {
            let decoder = JSONDecoder()
           
            return try decoder.decode(Movie.self, from: data)
        } catch {
            throw MovieError.invalidData
        }
    }
    
   
}


enum MovieError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
