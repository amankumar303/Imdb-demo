//
//  MovieCellViewModel.swift
//  ImdbDemo
//
//  Created by Aman Kumar on 25/06/22.
//

import Foundation

struct MovieCellViewModel: Identifiable {
    var movie: Movie
    
    var id: Int {
        movie.id
    }
    
    var title: String {
        movie.title
    }
    
    var description: String {
        movie.overview
    }
    
    var imageUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500/" + movie.backdropPath)
    }
}
