//
//  MovieListViewModel.swift
//  ImdbDemo
//
//  Created by Aman Kumar on 25/06/22.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies = [MovieCellViewModel]()
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    func fetchData() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            if let url = Bundle.main.url(forResource: "sampleResponse", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(MoviesResponseModel.self, from: data)
                    self.movies = jsonData.results.compactMap({ MovieCellViewModel(movie: $0) })
                    print(self.movies.count)
                } catch {
                    self.errorMessage = error.localizedDescription
                    print("error:\(error)")
                }
            }
            self.isLoading = false
        }
    }
}
