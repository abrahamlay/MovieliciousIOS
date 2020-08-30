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
        var body: some View{
            List{
                
                CellComponent(imageContent: "content1", profileContent: "profile", title: "Tutorial Beginner Android #1", desc: "Menjadi Android Developer itu mudah...", duration: "10:50", statistics: "300x ditonton - 9 jam yang lalu")
                
                CellComponent(imageContent: "content2", profileContent: "profile", title: "Tutorial Beginner Android #2", desc: "Menjadi Android Developer itu mudah...", duration: "10:50", statistics: "300x ditonton - 9 jam yang lalu")
                
                CellComponent(imageContent: "content3", profileContent: "profile", title: "Tutorial Beginner Android #3", desc: "Menjadi Android Developer itu mudah...", duration: "10:50", statistics: "300x ditonton - 9 jam yang lalu")
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
