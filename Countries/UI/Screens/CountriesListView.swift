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
	
	var body: some View {
		List(countryViewModel.countries) { country in
			CountryListCell(country: country)
				.onTapGesture {
					router.countriesPath.append(country)
				}
		}
		.navigationDestination(for: Country.self) { country in
			CountryDetailView(country: country)
		}
		.navigationDestination(for: Union.self) { union in
			UnionDetailView(union: union)
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
