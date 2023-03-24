//
//  FavoriteCountriesViewModel.swift
//  Countries
//
//  Created by Богдан Беннер on 9.03.23.
//
import Foundation
import SwiftUI

class FavoriteCountriesViewModel: ObservableObject {
	@Published var favoriteCountries = Set<Country>() {
		didSet {
			saveFavorites()
		}
	}
	
	init() {
		loadFavorites()
	}
	
	func add(_ country: Country) {
		favoriteCountries.insert(country)
		saveFavorites()
	}
	func remove(_ country: Country) {
		favoriteCountries.remove(country)
		saveFavorites()
	}
	
	func toggleFavorite(for country: Country) {
		if favoriteCountries.contains(country) {
			remove(country)
		} else {
			add(country)
		}
	}
	
	func loadFavorites() {
		if let favoritesData = UserDefaults.standard.data(forKey: Consts.favoritesKey) {
			let decoder = JSONDecoder()
			if let decodedData = try? decoder.decode(Set<Country>.self, from: favoritesData) {
				favoriteCountries = decodedData
			}
		}
	}
	
	private func saveFavorites() {
		let encoder = JSONEncoder()
		if let encodedData = try? encoder.encode(favoriteCountries) {
			UserDefaults.standard.set(encodedData, forKey: Consts.favoritesKey)
		}
	}
}
