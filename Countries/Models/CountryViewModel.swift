//
//  CountryViewModel.swift
//  Countries
//
//  Created by Богдан Беннер on 12.01.23.
//

import Foundation

class CountryViewModel: ObservableObject {
	@Published var countries = [Country]()
	@Published var isLoading = false
	public static let sampleCountry = Country(name: Name(common: "Austria", official: "Republic of Austria"), tld: [".at"], cca2: "AT", ccn3: "040", cca3: "AUT", independent: true, status: "officially-assigned", unMember: true, currencies: ["EUR": Currency(name: "Euro", symbol: "€")], capital: ["Vienna"], altSpellings: ["AT", "Osterreich", "Oesterreich"], region: "Europe", subregion: "Western Europe", languages: ["bar": "Austro-Bavarian German"], latlng: [47.33333333, 13.33333333], landlocked: true, borders: ["CZE", "DEU", "HUN", "ITA", "LIE", "SVK", "SVN", "CHE"], area: 83871, flag: "🇦🇹")

	func loadData(fileName: String) {
		isLoading = true
		guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return }

		do {
			let data = try Data(contentsOf: url)
			let decoder = JSONDecoder()
			countries = try decoder.decode([Country].self, from: data)
			isLoading = false
		} catch {
			print(error)
			isLoading = false
		}
	}
}
