//
//  ContentView.swift
//  ImdbDemo
//
//  Created by Aman Kumar on 25/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MovieListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
