//
//  ContentView.swift
//  Countries
//
//  Created by Богдан Беннер on 29.12.22.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var router: Router
	@State private var path: [Int] = []
	
	var body: some View {
		TabView(selection: $router.selectedTab) {
			CountriesListView()
				.tabItem {
					Button {
						Router.shared.selectedTab = 0
					} label: {
						Label("Countries", systemImage: "globe.europe.africa")
					}
				}
				.tag(0)
			UnionListView()
				.tabItem {
					Button {
						Router.shared.selectedTab = 1
					} label: {
						Label("Unions", systemImage: "checkerboard.shield")
					}
				}
				.tag(1)
			FavouritesView()
				.tabItem {
					Button {
						Router.shared.selectedTab = 2
					} label: {
						Label("Favourites", systemImage: "star")
					}
				}.tag(2)
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
