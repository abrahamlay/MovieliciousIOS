//
//  HomeUI.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 30/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
    ZStack{
        TabView{
            Home()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
            }
        Library()
            .tabItem{
                    Image(systemName: "play.rectangle.fill")
                    Text("Library")
            }
        }
        .accentColor(Color.blue)
    }
    
}
    

    struct Home : View {
        var body: some View{
            NavigationView{
                    HomeContent()
                
                    .navigationBarItems(
                        leading:
                        HStack{
                            Button(action: {print("Go to top of the list...")}){
                                Text("Movielicious").bold()
                            }
                        },
                        trailing:
                        HStack(spacing:20){
                                Button(action: {print("Do Search...")}){
                                    Image(systemName: "magnifyingglass").foregroundColor(Color.secondary)
                                }
                        
                        }
                    )
                
                        .navigationBarTitle("", displayMode: .inline)
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }

    
    struct HomeContent : View {
        init() {
            if #available(iOS 14.0, *) {
                // iOS 14 doesn't have extra separators below the list by default.
            } else {
                // To remove only extra separators below the list:
                UITableView.appearance().tableFooterView = UIView()
            }

            // To remove all separators including the actual ones:
            UITableView.appearance().separatorStyle = .none
        }
        
        @ObservedObject var repository = MovieRepositoryImpl()
        
        var body: some View{
            List(repository.movieList.results, id: \.self){ movie in
                CellComponent(thumbnailId: movie.backdropPath ?? "", title: movie.title ?? "",dateRelease: movie.releaseDate ?? "")
            }.onAppear(){
                self.repository.getPopular()
            }
        }
    }
    
    struct Library : View {
        var body: some View{
            Text("Library")
        }
    }

struct HomeUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
    
}
