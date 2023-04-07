//
//  FavoritesTests.swift
//  CountriesTests
//
//  Created by Богдан Беннер on 7.04.23.
//

import XCTest
@testable import Countries

class FavouritesTests: XCTest {
	let countryViewModel = CountryViewModel()
	let favouriteCountriesViewModel = FavoriteCountriesViewModel()

	func testAddingCountryToFavourites() {
		countryViewModel.loadData(fileName: "countries", testing: true)
		let randomCountry = countryViewModel.countries.randomElement()!
		favouriteCountriesViewModel.add(randomCountry)
		XCTAssertTrue(favouriteCountriesViewModel.favoriteCountries.contains(randomCountry))
	}
}
