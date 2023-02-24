//
//  CountryCellView.swift
//  Countries
//
//  Created by Богдан Беннер on 14.01.23.
//

import SwiftUI

struct CountryListCell: View {
	let country: Country
	
	var body: some View {
		VStack {
			HStack {
				Text(country.name.common)
				Spacer()
				Text(country.flag)
			}
			.padding(.bottom, 3)
			HStack {
				if(!country.capital[0].isEmpty) {
					Text("Capital: \(country.capital[0])")
					Spacer()
				}
				if(!country.subregion.isEmpty) { Text(country.subregion) }
			}
			.font(.caption)
			.foregroundColor(.gray)
		}
		.padding(0)
	}
}

struct CountryCellView_Previews: PreviewProvider {
	static var previews: some View {
		let austria = Country(name: Name(common: "Austria", official: "Republic of Austria"), tld: [".at"], cca2: "AT", ccn3: "040", cca3: "AUT", independent: true, status: "officially-assigned", unMember: true, currencies: ["EUR": Currency(name: "Euro", symbol: "€")], capital: ["Vienna"], altSpellings: ["AT", "Osterreich", "Oesterreich"], region: "Europe", subregion: "Western Europe", languages: ["bar": "Austro-Bavarian German"], latlng: [47.33333333, 13.33333333], landlocked: true, borders: ["CZE", "DEU", "HUN", "ITA", "LIE", "SVK", "SVN", "CHE"], area: 83871, flag: "🇦🇹")
		CountryListCell(country: austria)
			.previewLayout(.sizeThatFits)
	}
}
