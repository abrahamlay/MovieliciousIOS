//
//  DetailMovieView.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 31/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct DetailMovieView: View {
    var repository = MovieRepositoryImpl()
    var movie : Movie
    var body: some View {
        HStack(alignment: .top){
            VStack{
                DetailHeader(movie: movie)
                DetailBody(movie: movie)
            }
        }.onAppear(){
//            repository.getDetail(id: movie.id)
        }
       
    }
}


struct DetailHeader : View {
    var movie : Movie
    var body: some View{
        VStack(alignment: .leading){
            Banner(thumbnailId: movie.backdropPath ?? "0")
            HStack{
                Text(movie.title ?? "Movie Title")
                    .padding()
                    .font(.headline)
            
                Rating(rating: Int(movie.popularity))
            }
        }
    }
}


struct Banner: View{
    var thumbnailId: String
    var body : some View {
        ZStack{
            KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(thumbnailId)"))
                .resizable()
                .frame(height: 200)
        }
    }
}

struct Rating: View {
    var rating: Int
    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    var body : some View {
        VStack {
            if label.isEmpty == false {
                Text(label)
            }
            HStack{
                ForEach(1..<maximumRating + 1) { number in
                    self.image(for: number)
                        .foregroundColor(number > self.rating ? self.offColor : self.onColor)
    //                    .onTapGesture {
    //                        rating = number
    //                    }.......
                }
            }
        }.padding(.trailing)
    }
}

struct DetailBody: View{
    var movie: Movie
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(movie.overview ?? "Movie Description")
                .padding()
                .font(.body)
            DetailBodyInfo(value: dateFormaterUtils(dateString: movie.releaseDate ?? ""), label: "Release Date")
        }
    }
}

struct DetailBodyInfo: View {
    var value = ""
    var label = ""
    var body: some View{
        HStack{
            if !value.isEmpty {
                Text("\(label) :")
                    .bold()
                    .font(.callout)
                    .padding()
                Text(value).font(.body)
            }
            
        }
    }
}
struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(repository: MovieRepositoryImpl(), movie: Movie( voteCount: 100,
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
