//
//  MovieListView.swift
//  ImdbDemo
//
//  Created by Aman Kumar on 25/06/22.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(movieListViewModel.movies) { cellModel in
                        MovieCellView(viewModel: cellModel)
                    }
                }
                .foregroundColor(.red)
            }
        }
        .overlay(
            movieListViewModel.isLoading ? ProgressView() : nil
        )
        .progressViewStyle(CircularProgressViewStyle())
        .onAppear {
            movieListViewModel.fetchData()
        }
        .navigationBarHidden(true)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
