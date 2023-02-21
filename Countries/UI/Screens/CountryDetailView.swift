//
//  CountryDetailView.swift
//  Countries
//
//  Created by Богдан Беннер on 14.01.23.
//

import SwiftUI

struct CountryDetailView: View {
	var country: Country
	@EnvironmentObject private var countryUnionViewModel: CountryUnionViewModel
	
	var body: some View {
		VStack {
			// Display the flag of the country
			FlagView(country: country)
			// Display the common name of the country
			Text(country.name.common)
				.font(.largeTitle)
			
			// Display the official name of the country
			Text("aka \(country.name.official)")
				.font(.headline)
				.fontDesign(.monospaced)
				.italic()
			
			// Display the currency of the country
			if let currency = country.currencies.first {
				Text("Currency: \(currency.value.name) (\(currency.value.symbol))")
			}
			
			// Display the capital city of the country
			if let capital = country.capital.first {
				Text("Capital: \(capital)")
			}
			
			// Display the region and subregion of the country
			Text("Region: \(country.region)")
			Text("Subregion: \(country.subregion)")
			// Unions
				let unions = countryUnionViewModel.getUnions(for: country)
				UnionScrollableGallery(unions: unions)
			// Display the bordering countries
			let borderingCountriesText = country.borders.isEmpty ? "None" : country.borders.joined(separator: ", ")
			Text("Bordering Countries: \(borderingCountriesText)")
			Text("Top Level Domain:\(country.tld.joined(separator: ","))")
		}
		.font(.title3)
		.padding()
	}
}
struct CountryDetailView_Previews: PreviewProvider {
	static var previews: some View {
		CountryDetailView(country: CountryViewModel.sampleAustria)
		CountryDetailView(country: CountryViewModel.sampleItaly)
	}
}
