//
//  SearchView.swift
//  WeatherAppTwo
//
//  Created by Bhat, Samhitha on 25/01/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = WeatherViewViewModel()
    
    var body: some View {
        if viewModel.isSearchPressed {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
    SearchView()
}
