//
//  MovieCellView.swift
//  ImdbDemo
//
//  Created by Aman Kumar on 25/06/22.
//

import SwiftUI

struct MovieCellView: View {
    var viewModel: MovieCellViewModel
    @State private var isShowingDetail = false
    
    var body: some View {
        HStack {
            AsyncImage(url: viewModel.imageUrl)
                .scaledToFit()
                .frame(width: 60, height: 110)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.title)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                Text(viewModel.description)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical, 15)
            .padding(.leading, 15)
            .padding(.trailing, 8)
            NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movie: viewModel.movie)), isActive: $isShowingDetail) {
                EmptyView()
            }
        }
        .frame(height: 114)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
        .onTapGesture {
            isShowingDetail.toggle()
        }
    }
}
