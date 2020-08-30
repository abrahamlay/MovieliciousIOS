//
//  CellComponent.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 30/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import Foundation
import SwiftUI

struct CellComponent :View{
    
    var imageContent: String
    var profileContent: String
    var title: String
    var desc: String
    var duration: String
    var statistics: String
    var body: some View{
        VStack{
            ZStack(alignment: .bottomLeading){
                Image(imageContent)
                    .resizable()
                    .frame(height: 240)
                HStack(spacing: 20){
                    VStack (alignment: .leading){
                        Text(title)
                            .font(.headline)
                        Text(desc)
                            .font(.caption)
                        Text(statistics)
                            .font(.caption)
                    }.padding(10)
                    Spacer()
                }.background(Color.gray)
            }
        }
    }
}

struct CellComponent_Previews: PreviewProvider {
    static var previews: some View {
        List{
            
            CellComponent(imageContent: "content1", profileContent: "profile", title: "Tutorial Beginner Android #1", desc: "Menjadi Android Developer itu mudah...", duration: "10:50", statistics: "300x ditonton - 9 jam yang lalu")
            
            CellComponent(imageContent: "content2", profileContent: "profile", title: "Tutorial Beginner Android #2", desc: "Menjadi Android Developer itu mudah...", duration: "10:50", statistics: "300x ditonton - 9 jam yang lalu")
            
            CellComponent(imageContent: "content3", profileContent: "profile", title: "Tutorial Beginner Android #3", desc: "Menjadi Android Developer itu mudah...", duration: "10:50", statistics: "300x ditonton - 9 jam yang lalu")
        }
    }
}
