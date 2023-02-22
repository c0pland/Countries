//
//  CountryUnion.swift
//  Countries
//
//  Created by Богдан Беннер on 3.02.23.
//

import Foundation

struct CountryUnion: Codable, Hashable, Identifiable {
	var id: String { abbreviation }
	let fullName: String
	let abbreviation: String
	let dateOfCreation: String
	let numberOfMembers: Int
	let members: [String]
}
