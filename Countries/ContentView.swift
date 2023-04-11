//
//  ContentView.swift
//  Countries
//
//  Created by Богдан Беннер on 29.12.22.
//

import SwiftUI

struct ContentView: View {
	@StateObject var router = Router()
	
	var body: some View {
		TabView(selection: createTabViewBinding()) {
			NavigationStack(path: $router.countriesPath) {
				CountriesListView()
			}
			.navigationTitle(router.navigationTitle)
			.tag(Tabs.countries)
			.tabItem {
				Label("Countries", systemImage: "globe.europe.africa")
				
			}
//			.onAppear {
//				router.navigationTitle = "Countries"
//				router.selectedTab = Tabs.countries
//			}
			
			NavigationStack(path: $router.unionsPath) {
				UnionListView()
			}
			.tag(Tabs.unions)
			.tabItem {
				Label("Unions", systemImage: "checkerboard.shield")
			}
//			.onAppear {
//				router.navigationTitle = "Unions"
//				router.selectedTab = Tabs.unions
//			}
			
			NavigationStack(path: $router.favoritesPath) {
				FavouritesView()
			}
			.tag(Tabs.favorites)
			.tabItem {
				Label("Favourites", systemImage: "star")
			}
//			.onAppear {
//				router.navigationTitle = "Favorites"
//				router.selectedTab = Tabs.favorites
//			}
		}
		.navigationTitle(router.navigationTitle)
		.environmentObject(router)
	}
	
	private func createTabViewBinding() -> Binding<Tabs> {
		Binding<Tabs>(
			get: { router.selectedTab },
			set: { selectedTab in
				if selectedTab == router.selectedTab {
					print("tapped same tab")
					switch selectedTab {
					case .countries:
						withAnimation {
							router.countriesPath = NavigationPath()
						}
					case .unions:
						withAnimation {
							router.unionsPath = NavigationPath()
						}
					case .favorites:
						withAnimation {
							router.favoritesPath = NavigationPath()
						}
					}
				}
				router.selectedTab = selectedTab
			})
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
