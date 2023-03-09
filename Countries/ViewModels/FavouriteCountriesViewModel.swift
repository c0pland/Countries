//
//  FavoriteCountriesViewModel.swift
//  Countries
//
//  Created by Богдан Беннер on 9.03.23.
//
import Foundation
import SwiftUI

class FavouriteCountriesViewModel: ObservableObject {
	@Published var favouriteCountries = Set<Country>()
	let favouritesKey = "Favourite-Countries"
	
	init() {
		if let favouritesData = UserDefaults.standard.data(forKey: favouritesKey) {
			let decoder = JSONDecoder()
			if let decodedData = try? decoder.decode(Set<Country>.self, from: favouritesData) {
				favouriteCountries = decodedData
			}
		}
	}
	
	func add(_ country: Country) {
		favouriteCountries.insert(country)
		saveFavourites()
	}
	
	func remove(_ country: Country) {
		favouriteCountries.remove(country)
		saveFavourites()
	}
	
	func toggleFavourite(for country: Country) {
		if favouriteCountries.contains(country) {
			favouriteCountries.remove(country)
		} else {
			favouriteCountries.insert(country)
		}
		saveFavourites()
	}
	
	func saveFavourites() {
		let encoder = JSONEncoder()
		if let encodedData = try? encoder.encode(favouriteCountries) {
			UserDefaults.standard.set(encodedData, forKey: favouritesKey)
		}
	}
}
