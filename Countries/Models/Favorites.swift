//
//  Favorites.swift
//  Countries
//
//  Created by Богдан Беннер on 27.02.23.
//

import SwiftUI

class Favorites: ObservableObject {
	private var favoriteCountries: Set<Country>
	private var favoriteUnions: Set<Union>
	let defaults = UserDefaults.standard
	
	init() {
		let decoder = JSONDecoder()
		if let countryData = defaults.value(forKey: "Favorite-Countries") as? Data {
			let decodedCountryData = try? decoder.decode(Set<Country>.self, from: countryData)
			self.favoriteCountries = decodedCountryData ?? []
		} else {
			self.favoriteCountries = []
		}
		
		if let unionData = defaults.value(forKey: "Favorite-Unions") as? Data {
			let decodedUnionData = try? decoder.decode(Set<Union>.self, from: unionData)
			self.favoriteUnions = decodedUnionData ?? []
		} else {
			self.favoriteUnions = []
		}
	}
	
	func getFavoriteCountries() -> Set<Country> {
		return self.favoriteCountries
	}
}
