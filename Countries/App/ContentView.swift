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
		ScrollViewReader { proxy in
			TabView(selection: createTabViewBinding(scrollViewProxy: proxy)) {
				NavigationStack(path: $router.countriesPath) {
					CountriesListView()
				}
				.navigationTitle(router.navigationTitle)
				.tag(Tabs.countries)
				.tabItem {
					Label("Countries", systemImage: "globe.europe.africa")
					
				}
				.onAppear {
					router.navigationTitle = "Countries"
				}
				
				NavigationStack(path: $router.unionsPath) {
					UnionListView()
				}
				.tag(Tabs.unions)
				.tabItem {
					Label("Unions", systemImage: "checkerboard.shield")
				}
				.onAppear {
					router.navigationTitle = "Unions"
				}
				
				NavigationStack(path: $router.favoritesPath) {
					FavouritesView()
				}
				.tag(Tabs.favorites)
				.tabItem {
					Label("Favorites", systemImage: "star")
				}
				.onAppear {
					router.navigationTitle = "Favorites"
				}
				NavigationStack(path: $router.settingsPath) {
					SettingsView()
				}
				.tag(Tabs.settings)
				.tabItem {
					Label("Settings", systemImage: "gearshape")
				}
				.onAppear {
					router.navigationTitle = "Settings"
				}
			}
			.environmentObject(router)
		}
	}
	
	private func createTabViewBinding(scrollViewProxy: ScrollViewProxy) -> Binding<Tabs> {
		Binding<Tabs>(
			get: { router.selectedTab },
			set: { selectedTab in
				if selectedTab == router.selectedTab {
					switch selectedTab {
					case .countries:
						if router.countriesPath.isEmpty {
							// Scroll to top
							withAnimation {
								scrollViewProxy.scrollTo(ScrollAnchor.countries, anchor: .bottom)
							}
						} else {
							// Pop to root
							withAnimation {
								router.countriesPath = NavigationPath()
							}
						}
					case .unions:
						if router.unionsPath.isEmpty {
							// Scroll to top
							withAnimation {
								scrollViewProxy.scrollTo(ScrollAnchor.unions, anchor: .bottom)
							}
						} else {
							// Pop to root
							withAnimation {
								router.unionsPath = NavigationPath()
							}
						}
					case .favorites:
						if router.favoritesPath.isEmpty {
							// Scroll to top
							withAnimation {
								scrollViewProxy.scrollTo(ScrollAnchor.favorites, anchor: .bottom)
							}
						} else {
							// Pop to root
							withAnimation {
								router.favoritesPath = NavigationPath()
							}
						}
					case .settings:
						if router.settingsPath.isEmpty {
							// Scroll to top
							withAnimation {
								scrollViewProxy.scrollTo(ScrollAnchor.settings, anchor: .bottom)
							}
						} else {
							// Pop to root
							withAnimation {
								router.settingsPath = NavigationPath()
							}
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
