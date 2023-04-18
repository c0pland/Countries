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
	@EnvironmentObject private var router: Router
	@State private var searchText = ""
	
	var body: some View {
		List {
			ForEach(searchResults) { country in
				CountryListCell(country: country)
					.onTapGesture {
						router.countriesPath.append(country)
					}
					.id(ScrollAnchor.countries)
			}
		}
		.navigationTitle(router.navigationTitle)
		.navigationDestination(for: Country.self) { country in
			CountryDetailView(country: country)
		}
		.navigationDestination(for: Union.self) { union in
			UnionDetailView(union: union)
		}
		.searchable(text: $searchText)
	}
	
	var searchResults: [Country] {
		if searchText.isEmpty {
			return countryViewModel.countries
		} else {
			return countryViewModel.countries.filter { country in
				country.name.common.contains(searchText) ||
				country.name.official.contains(searchText) ||
				country.capital.contains(searchText) // ||
				// ((country.currencies.first?.value.name.contains(searchText)) != nil)
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
			.environmentObject(Router())
	}
}
