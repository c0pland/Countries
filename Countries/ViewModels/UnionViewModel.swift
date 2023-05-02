//
//  CountryUnionViewModel.swift
//  Countries
//
//  Created by Богдан Беннер on 3.02.23.
//

import Foundation

class UnionViewModel: ObservableObject {
	@Published var unions = [Union]()
	
	func loadData(fileName: String, testing: Bool = false) {
			guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
				print("File not found")
				return
			}
			do {
				let data = try Data(contentsOf: url)
				let decoder = JSONDecoder()
				unions = try decoder.decode([Union].self, from: data)
			} catch {
				print("Error decoding JSON: \(error)")
			}
		}
	
	func containsMember(union: Union, country: Country) -> Bool {
		return union.members.contains(country.name.common) || union.members.contains(country.name.official)
	}
	
	func getUnions(for country: Country) -> [Union] {
		let result = unions.filter { union in
			containsMember(union: union, country: country)
		}
		return result
	}
	
	func getMembers(for union: Union) -> [Country] {
		var result = [Country]()
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries")
		for memberName in union.members {
			let member = countryViewModel.countries.first { element in
				element.name.common == memberName
			}
			if member != nil { result.append(member!) }
		}
		return result
	}
}
