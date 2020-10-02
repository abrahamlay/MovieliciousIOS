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
        
        @State var showSearchBar = false
        
        var body: some View{
            NavigationView{
                HomeContent(showSearchBar: $showSearchBar)
                    .navigationBarItems(
                        leading:
                        HStack{
                            Button(action: {print("Go to top of the list...")}){
                                Text("Movielicious").bold()
                            }
                        },
                        trailing:
                        HStack(spacing:20){
                                Button(action: {
                                    self.showSearchBar.toggle()
                                }){
                                    Image(systemName: "magnifyingglass").foregroundColor(Color.secondary)
                                }
                        
                        }
                    )
                
                        .navigationBarTitle("", displayMode: .inline)
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }

    
    struct HomeContent : View {
        @Binding var showSearchBar: Bool
        @ObservedObject var repository = MovieRepositoryImpl()
        @State private var searchText : String = ""
        
        init(showSearchBar: Binding<Bool>) {
           // To remove all separators including the actual ones:
//           UITableView.appearance().separatorStyle = .none
            self._showSearchBar = showSearchBar
        }
        var body: some View{
        
            VStack{
                    if self.showSearchBar{
                        SearchBar(text: self.$searchText)
                    }
//                    GeometryReader{ geometry in
//                        CustomScrollView(width:
//                            geometry.size.width, height:
//                            geometry.size.height , handlePullToRefresh: {
//                            self.repository.getPopular()
//                        }) {
                            List(self.repository.movieList.results.filter{movie in
                                self.searchText.isEmpty ? true : movie.title?.contains(self.searchText) ?? true
                                
                            }, id: \.self){ movie in
                                    ZStack{
                                        CellComponent(thumbnailId: movie.backdropPath ?? "", title: movie.title ?? "",dateRelease: movie.releaseDate ?? "")
                                        NavigationLink(destination: DetailMovieView(movie: movie)){
                                                EmptyView()
                                        }.navigationBarTitle(Text("Popular"), displayMode: .inline)
                                    
                                    }
//                            }
//                        }
                }
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
