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
			CountryUnionsListView()
				.tabItem {
					Label("Unions", systemImage: "checkerboard.shield")
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		let countryViewModel = CountryViewModel()
		let countryUnionViewModel = CountryUnionViewModel()
		countryViewModel.loadData(fileName: "countries")
		countryUnionViewModel.loadData(fileName: "unions")
		return ContentView()
			.environmentObject(countryViewModel)
			.environmentObject(countryUnionViewModel)
    }
}
