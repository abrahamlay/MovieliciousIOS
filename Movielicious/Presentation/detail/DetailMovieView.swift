//
//  DetailMovieView.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 31/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import SwiftUI

struct DetailMovieView: View {
    var movie : Movie
    var body: some View {
        Text(movie.title ?? /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(movie: Movie( voteCount: 100,
            id: 1,
            video: false,
            voteAverage: 4.5,
            title: "Avengers : Infinity Wars",
            popularity: 4.5,
            posterPath: "/orjiB3oUIsyz60hoEqkiGpy5CeO.jpg",
            originalLanguage: "en",
            originalTitle: "Avengers : Infinity Wars",
            genreIds: [12,12,12],
            backdropPath: "/orjiB3oUIsyz60hoEqkiGpy5CeO.jpg",
            adult: false,
            overview: "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store.",
            releaseDate: "2020-08-01"))
    }
}
