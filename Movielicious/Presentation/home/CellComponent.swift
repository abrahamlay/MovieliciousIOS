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
            CellComponent(thumbnailId: "content1",title: "Tutorial Beginner Android #1",dateRelease: "2020-08-20")
            
            CellComponent(thumbnailId: "content2", title: "Tutorial Beginner Android #2",dateRelease: "2020-08-20")
            
            CellComponent(thumbnailId: "content3", title: "Tutorial Beginner Android #3", dateRelease: "2020-08-20")
        }
    }
}
