//
//  MovieDetailView.swift
//  ImdbDemo
//
//  Created by Aman Kumar on 25/06/22.
//

import SwiftUI

struct MovieDetailView: View {

    var viewModel: MovieDetailViewModel
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: viewModel.imageUrl)
                    .frame(width: 170, height: 250)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 25) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Release Date")
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                            
                        
                        Text(viewModel.releaseDate)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("⭐ Rating")
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                        
                        Text(viewModel.rating)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("❤️ Popularity")
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                        
                        Text(viewModel.popularity)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                    }
                }
                .padding(.horizontal, 15)
                Spacer()
            }
            .padding(.vertical, 60)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Overview")
                    .foregroundColor(.gray)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                
                Text(viewModel.description)
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
            }
            
            Spacer()
        }
        .padding(.horizontal, 15)
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(false)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(movie: getDummyMovie()))
    }
    
    static func getDummyMovie() -> Movie {
        var movie: Movie!
        if let url = Bundle.main.url(forResource: "sampleResponse", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesResponseModel.self, from: data)
                return jsonData.results.first!
                
            } catch {
                print("error:\(error)")
            }
        }
        return movie
    }
}
