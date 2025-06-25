//
//  ContentView.swift
//  FilmCatalog
//
//  Created by Dmitrii Nazarov on 24.06.2025.
//

import SwiftUI

struct HomeView: View {
    let networkManager = NetworkManager()
    @State private var movie: Movie?
    
    var body: some View {
        
        ScrollView {
                    VStack(spacing: 16) {
                       MovieCardView(movie: movie)
                       
                    }
                    .padding()
                }
        .padding()
        .task {
            do {
                movie = try await NetworkManager().getMovie()
               
                
            } catch MovieError.invalidURL {
                print("invalid url")
            } catch MovieError.invalidData {
                print("invalid data")
            } catch MovieError.invalidResponse {
                print("invalid response")
            } catch {
                print("unexpected error")
            }
        }
    }
}

#Preview {
    HomeView()
}

struct MovieCardView: View {
    let movie: Movie?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: URL(string: movie?.poster?.url ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundStyle(.blue)
            }
            .frame(width: 120, height: 120)

            Text(movie?.alternativeName ?? "There's no description for this movie")
                .bold()
                .font(.title)

            Text("\(movie?.year ?? 1970)")
                .padding()
        }
        .padding()
    }
}
