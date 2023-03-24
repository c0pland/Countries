//
//  CountriesListView.swift
//  Countries
//
//  Created by Богдан Беннер on 9.01.23.
//

import SwiftUI

struct CountriesListView: View {
	@EnvironmentObject private var countryViewModel: CountryViewModel
	@ObservedObject var favoriteCountriesViewModel = FavoriteCountriesViewModel()

	var body: some View {
		NavigationView {
			VStack {
				List(countryViewModel.countries) { country in
					NavigationLink(destination: CountryDetailView(country: country)) {
						CountryListCell(country: country)
					}
				}
			}
			.navigationTitle("Countries")
			.onAppear {
				favoriteCountriesViewModel.loadFavorites()
			}
		}
	}
}

struct CountriesListView_Previews: PreviewProvider {
	
	static var previews: some View {
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries")
		return CountriesListView()
			.environmentObject(countryViewModel)
	}
}
