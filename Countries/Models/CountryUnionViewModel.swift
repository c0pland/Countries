//
//  CountryUnionViewModel.swift
//  Countries
//
//  Created by Богдан Беннер on 3.02.23.
//

import Foundation

class CountryUnionViewModel: ObservableObject {
	lazy var nato = CountryUnion(fullName: "North Atlantic Treaty Organisation", abbreviation: "NATO", dateOfCreation: "1949-04-04", numberOfMembers: 30, members: ["USA", "Canada", "France", "Germany", "Italy", "Norway", "Denmark", "Netherlands", "Luxembourg", "Belgium", "United Kingdom", "Iceland", "Portugal", "Spain", "Greece", "Turkey", "Czech Republic", "Hungary", "Poland", "Bulgaria", "Romania", "Slovakia", "Estonia", "Latvia", "Lithuania", "Albania", "Croatia", "North Macedonia", "Slovenia", "Montenegro"])
	
	lazy var europeanUnion = CountryUnion(fullName: "European Union", abbreviation: "EU", dateOfCreation: "1993-11-01", numberOfMembers: 27, members: ["Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden"])
	
	lazy var schengenArea = CountryUnion(fullName: "Schengen Area", abbreviation: "Schengen", dateOfCreation: "1995-03-26", numberOfMembers: 27, members: ["Austria", "Belgium", "Czech Republic", "Croatia", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Iceland", "Italy", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland"])
	lazy var eurozone = CountryUnion(fullName: "Eurozone", abbreviation: "Eurozone", dateOfCreation: "1999-01-01", numberOfMembers: 20, members: ["Austria", "Belgium", "Cyprus", "Croatia", "Estonia", "Finland", "France", "Germany", "Greece", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Portugal", "Slovakia", "Slovenia", "Spain"])
	// UN membership is in each country properties
	lazy var unitedNations = CountryUnion(fullName: "United Nations", abbreviation: "UN", dateOfCreation: "1945-06-26", numberOfMembers: 195, members: [])
	lazy var unions = [nato, europeanUnion, schengenArea, eurozone, unitedNations]
	
	func containsMember(union: CountryUnion, country: Country) -> Bool {
		if union == unitedNations { return country.unMember }
		return union.members.contains(country.name.common)
	}
	
	func getUnions(for country: Country) -> [CountryUnion] {
		let result = unions.filter { union in
			containsMember(union: union, country: country)
		}
		return result
	}
}
