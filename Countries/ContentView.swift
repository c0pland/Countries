//
//  ContentView.swift
//  Countries
//
//  Created by Богдан Беннер on 29.12.22.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var router: Router
	
	var body: some View {
		TabView(selection: $router.selectedTab) {
			NavigationStack(path: $router.countriesPath) {
				CountriesListView()
			}
					.tag(0)
					.tabItem {
						Label("Countries", systemImage: "globe.europe.africa")
					}
					.onAppear {
						router.navigationTitle = "Countries"
						router.selectedTab = 0
					}
			
			NavigationStack(path: $router.unionsPath) {
				UnionListView()
			}
					.tag(1)
					.tabItem {
						Label("Unions", systemImage: "checkerboard.shield")
					}
					.onAppear {
						router.navigationTitle = "Unions"
						router.selectedTab = 1
					}
		
			NavigationStack(path: $router.favoritesPath) {
				FavouritesView()
			}
					.tag(2)
					.tabItem {
						Label("Favourites", systemImage: "star")
					}
					.onAppear {
						router.navigationTitle = "Favorites"
						router.selectedTab = 2
					}
			}
		.navigationTitle(router.navigationTitle)
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
			.environmentObject(Router())
	}
}
