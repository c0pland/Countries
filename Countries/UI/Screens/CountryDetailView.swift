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
			AsyncImage(url: URL(string: "https://www.countryflagsapi.com/png/\(country.cca3)")) { image in
				image
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 200, height: 200, alignment: .center)
					.padding()
							} placeholder: {
								Image(systemName: "photo.fill")
							}
							.frame(width: 250, height: 250)
			// Display the common name of the country
			Text(country.name.common)
				.font(.title)

			// Display the official name of the country
			Text(country.name.official)
				.font(.subheadline)

			// Display the currency of the country
			if let currency = country.currencies.first {
				Text("Currency: \(currency.value.name) (\(currency.value.symbol))")
					.font(.subheadline)
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
		let austria = Country(name: Name(common: "Austria", official: "Republic of Austria"), tld: [".at"], cca2: "AT", ccn3: "040", cca3: "AUT", independent: true, status: "officially-assigned", unMember: true, currencies: ["EUR": Currency(name: "Euro", symbol: "€")], capital: ["Vienna"], altSpellings: ["AT", "Osterreich", "Oesterreich"], region: "Europe", subregion: "Western Europe", languages: ["bar": "Austro-Bavarian German"], latlng: [47.33333333, 13.33333333], landlocked: true, borders: ["CZE", "DEU", "HUN", "ITA", "LIE", "SVK", "SVN", "CHE"], area: 83871, flag: "🇦🇹")
        CountryDetailView(country: austria)
    }
}
