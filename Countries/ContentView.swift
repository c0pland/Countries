//
//  ContentView.swift
//  Countries
//
//  Created by Богдан Беннер on 29.12.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			CountriesListView()
				.tabItem {
					Label("Countries", systemImage: "globe.europe.africa")
				}
			UnionListView()
				.tabItem {
					Label("Unions", systemImage: "checkerboard.shield")
				}
			FavouritesView()
				.tabItem {
					Label("Favourites", systemImage: "star")
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		let countryViewModel = CountryViewModel()
		let countryUnionViewModel = UnionViewModel()
		countryViewModel.loadData(fileName: "countries")
		countryUnionViewModel.loadData(fileName: "unions")
		return ContentView()
			.environmentObject(countryViewModel)
			.environmentObject(countryUnionViewModel)
    }
}
