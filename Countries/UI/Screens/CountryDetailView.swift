//
//  CountryDetailView.swift
//  Countries
//
//  Created by Богдан Беннер on 14.01.23.
//

import SwiftUI

struct CountryDetailView: View {
	// MARK: Properties
	var country: Country
	@EnvironmentObject private var countryViewModel: CountryViewModel
	@EnvironmentObject private var countryUnionViewModel: UnionViewModel
	@ObservedObject var favoriteCountriesViewModel = FavoriteCountriesViewModel()
	@EnvironmentObject private var router: Router
	
	var isFavorite: Bool {
		favoriteCountriesViewModel.favoriteCountries.contains(country)
	}
	// MARK: Body
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 10) {
				// Display the flag of the country
				HStack {
					Spacer()
					FlagView(country: country)
					Spacer()
				}
				// Display the common name of the country
				Text(country.name.common)
					.font(.largeTitle)
				// Display the official name of the country (if it differs)
				if country.name.official != country.name.common {
					Text("aka \(country.name.official)")
						.font(.headline)
						.fontDesign(.monospaced)
						.italic()
				}
				// Display the currency of the country
				if let currency = country.currencies.first {
					Text("***Currency:*** \(currency.value.name) (\(currency.value.symbol))")
				}
				// Display the capital city of the country
				if let capital = country.capital.first {
					Text("***Capital***: \(capital)")
				}
				// Display the region and subregion of the country
				Text("***Region***: \(country.region)")
				Text("***Subregion***: \(country.subregion)")
				// Unions
				Text("***Political Unions:***")
				let unions = countryUnionViewModel.getUnions(for: country)
				if !unions.isEmpty {
					UnionScrollableGallery(unions: unions)
				} else {
					Text("\(country.name.official) is not a member of any political unions")
				}
				// Display the bordering countries
				let neighbours = countryViewModel.getNeighbors(for: country)
				if neighbours.isEmpty {
					Text("***Bordering Countries:*** None")
					
				} else {
					Text("***Bordering Countries:***")
					BorderingCountriesScrollableGallery(countries: neighbours)
				}
			}
			.toolbar(content: {
				Button {
					favoriteCountriesViewModel.toggleFavorite(for: country)
				} label: {
					Image(systemName: isFavorite ? "star.fill" : "star")
				}
				
			})
			.font(.title3)
		.padding()
		}
	}
}
struct CountryDetailView_Previews: PreviewProvider {
	static var previews: some View {
		let countryViewModel = CountryViewModel()
		let countryUnionViewModel = UnionViewModel()
		countryViewModel.loadData(fileName: "countries")
		countryUnionViewModel.loadData(fileName: "unions")
		return CountryDetailView(country: countryViewModel.countries[Int.random(in: 0...150)])
			.environmentObject(countryViewModel)
			.environmentObject(countryUnionViewModel)
	}
}
