//
//  CellComponent.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 30/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

struct CellComponent : View{
    var thumbnailId: String
    var title: String
    var dateRelease: String
    var body: some View{
        VStack{
            ZStack(alignment: .bottomLeading){
                KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(thumbnailId)"))
                    .resizable()
                    .frame(height: 200)
                HStack(spacing: 20){
                    VStack (alignment: .leading){
                        Text(title)
                            .foregroundColor(Color.white)
                            .font(.headline)
                        Text(dateFormaterUtils(dateString: dateRelease))
                            .foregroundColor(Color.white)
                            .font(.caption)
                    }.padding(10)
                    Spacer()
                }.background(Color.gray.opacity(0.5))
            }
        }.cornerRadius(10)
    }
}

struct CellComponent_Previews: PreviewProvider {
    static var previews: some View {
        List{
            CellComponent(thumbnailId: "/lP5eKh8WOcPysfELrUpGhHJGZEH.jpg",title: "Bloodshot",dateRelease: "2020-08-20")
            
            CellComponent(thumbnailId: "/6ELJEzQJ3Y45HczvreC3dg0GV5R.jpg", title: "Black Panther",dateRelease: "2020-08-20")
            
            CellComponent(thumbnailId: "/orjiB3oUIsyz60hoEqkiGpy5CeO.jpg", title: "Avengers: Endgame", dateRelease: "2020-08-20")
        }
    }
}
