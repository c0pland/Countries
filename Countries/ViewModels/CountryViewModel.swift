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
	
	func loadData(fileName: String, testing: Bool = false) {
		guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
			print("File not found")
			return
		}
		do {
			let data = try Data(contentsOf: url)
			let decoder = JSONDecoder()
			countries = try decoder.decode([Country].self, from: data)
		} catch {
			print("Error decoding JSON: \(error)")
		}
	}
	
	func getNeighbors(for country: Country) -> [Country] {
		var result = [Country]()
		for borderingCountryCode in country.borders {
			let borderingCountry = self.countries.first { element in
				element.cca3 == borderingCountryCode
			}
			if borderingCountry != nil { result.append(borderingCountry!) }
		}
		return result
	}
}
