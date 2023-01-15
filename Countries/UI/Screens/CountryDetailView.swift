//
//  CountryDetailView.swift
//  Countries
//
//  Created by Богдан Беннер on 14.01.23.
//

import SwiftUI

struct CountryDetailView: View {
	var country: Country
	
	var body: some View {
		VStack {
			// Display the flag of the country
			FlagView(country: country)
			// Display the common name of the country
			Text(country.name.common)
				.font(.largeTitle)

			// Display the official name of the country
			Text(country.name.official)
				.font(.headline)

			// Display the currency of the country
			if let currency = country.currencies.first {
				Text("Currency: \(currency.value.name) (\(currency.value.symbol))")
					.font(.title3)
			}

			// Display the capital city of the country
			if let capital = country.capital.first {
				Text("Capital: \(capital)")
					.font(.subheadline)
			}

			// Display the region and subregion of the country
			Text("Region: \(country.region) (\(country.subregion))")
				.font(.subheadline)

			// Display the bordering countries
			let borderingCountriesText = country.borders.isEmpty ? "None" : country.borders.joined(separator: ", ")
			Text("Bordering Countries: \(borderingCountriesText)")
				.font(.subheadline)
		}
	}
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
		CountryDetailView(country: CountryViewModel.sampleCountry)
    }
}
