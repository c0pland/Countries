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
