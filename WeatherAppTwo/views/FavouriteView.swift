//
//  FavouriteView.swift
//  WeatherAppTwo
//
//  Created by Bhat, Samhitha on 30/01/24.
//

import SwiftUI

struct FavouriteView: View {
    @ObservedObject var mainViewModel: MainViewModel
    @Environment(\.colorScheme) var colorScheme
 
    var body: some View {
        VStack {
            Text("Favourite Cities")
                .font(.title)
                .bold()
                .padding()
                .background(Color("Background")) // Set background color for VStack
            
            List {
                ForEach(mainViewModel.favouriteCities, id: \.self) { cityName in
                    FavRow(mainViewModel: mainViewModel, cityName: cityName)
                        .listRowInsets(EdgeInsets())
                        .padding()
                        .background(Color("Card"))
                        .cornerRadius(10)
                }
                .listRowSeparator(.hidden)
                .padding()
                .background(Color("Background"))
                .listRowInsets(EdgeInsets())
            }
            .padding()
            .listRowInsets(EdgeInsets())
            .listStyle(PlainListStyle())
        }
        .background(Color("Background"))    }
}

//struct FavouriteView: View {
//    @ObservedObject var mainViewModel: MainViewModel
//    @Environment(\.colorScheme) var colorScheme
// 
//    var body: some View {
//        VStack {
//            Text("Favourite Cities")
//                .font(.title)
//                .bold()
//            
//            VStack {
//                List(mainViewModel.favouriteCities, id: \.self) { cityName in
//                    FavRow(mainViewModel: mainViewModel, cityName: cityName)
//                        .listRowInsets(EdgeInsets())
//                        .padding()
//                        .listRowBackground(Color("Card"))
//                }
//                .background(Color("Background"))
//            }
//            .background(Color("Background"))
//        }
//        .background(Color("Background"))
//    }
//}


#Preview {
    FavouriteView(mainViewModel: MainViewModel())
}
