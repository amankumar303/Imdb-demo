//
//  MovieDetailViewModel.swift
//  ImdbDemo
//
//  Created by Aman Kumar on 25/06/22.
//

import Foundation

struct MovieDetailViewModel {
    var movie: Movie
    
    var releaseDate: String {
        movie.releaseDate
    }
    
    var rating: String {
        "\(movie.voteAverage)"
    }
    
    var popularity: String {
        "\(movie.popularity)"
    }
    
    var description: String {
        movie.overview
    }
    
    var title: String {
        movie.title
    }
    
    var navigationTitle: String {
        movie.originalTitle
    }
    
    var imageUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500/" + movie.backdropPath)
    }
}
