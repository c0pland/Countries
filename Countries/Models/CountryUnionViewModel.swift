//
//  CountryUnionViewModel.swift
//  Countries
//
//  Created by Богдан Беннер on 3.02.23.
//

import Foundation

class CountryUnionViewModel: ObservableObject {
	@Published var nato = CountryUnion(fullName: "North Atlantic Treaty Organisation", abbreviation: "NATO", dateOfCreation: "April 4, 1949", numberOfMembers: 30, members: ["USA", "Canada", "France", "Germany", "Italy", "Norway", "Denmark", "Netherlands", "Luxembourg", "Belgium", "United Kingdom", "Iceland", "Portugal", "Spain", "Greece", "Turkey", "Czech Republic", "Hungary", "Poland", "Bulgaria", "Romania", "Slovakia", "Estonia", "Latvia", "Lithuania", "Albania", "Croatia", "North Macedonia", "Slovenia", "Montenegro"])
	
	@Published var europeanUnion = CountryUnion(fullName: "European Union", abbreviation: "EU", dateOfCreation: "1993-11-01", numberOfMembers: 27, members: ["Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden"])
	
	func containsMember(union: CountryUnion, country: Country) -> Bool {
		return union.members.contains(country.name.common)
	}
}
