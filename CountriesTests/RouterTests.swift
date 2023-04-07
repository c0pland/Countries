//
//  RouterTests.swift
//  CountriesTests
//
//  Created by Богдан Беннер on 7.04.23.
//

import XCTest
import SwiftUI
@testable import Countries

class RouterTests: XCTestCase {
	func testRouterInitialValues() {
		let router = Router()
		XCTAssertEqual(router.countriesPath.count, 0)
		XCTAssertEqual(router.unionsPath.count, 0)
		XCTAssertEqual(router.favoritesPath.count, 0)
		XCTAssertEqual(router.selectedTab, 0)
		XCTAssertEqual(router.navigationTitle, "Countries")
	}
	func testRouterCountriesPath() {
		let router = Router()
		XCTAssertEqual(router.countriesPath.count, 0)
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries", testing: true)
		guard let country = countryViewModel.countries.randomElement() else {
			XCTFail("Failed to get a random country")
			return
		}
		router.countriesPath.append(country)
		XCTAssertEqual(router.countriesPath.count, 1)
		XCTAssertEqual(router.countriesPath, NavigationPath([country]))
	}
	func testRouterUnionsPath() {
		let router = Router()
		let unionViewModel = UnionViewModel()
		unionViewModel.loadData(fileName: "unions", testing: true)
		XCTAssertEqual(router.unionsPath.count, 0)
		guard let union = unionViewModel.unions.randomElement() else {
			XCTFail("Failed to get a random union")
			return
		}
		router.unionsPath.append(union)
		XCTAssertEqual(router.unionsPath.count, 1)
		XCTAssertEqual(router.unionsPath, NavigationPath([union]))
	}
	func testRouterFavoritesPath() {
		let router = Router()
		XCTAssertEqual(router.favoritesPath.count, 0)
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries", testing: true)
		guard let country = countryViewModel.countries.randomElement() else {
			XCTFail("Failed to get a random country")
			return
		}
		router.favoritesPath.append(country)
		XCTAssertEqual(router.favoritesPath.count, 1)
		XCTAssertEqual(router.favoritesPath, NavigationPath([country]))
	}
	func testRouterSelectedTab() {
		let router = Router()
		XCTAssertEqual(router.selectedTab, 0)
		router.selectedTab = 1
		XCTAssertEqual(router.selectedTab, 1)
	}
	func testRouterNavigationTitle() {
		let router = Router()
		XCTAssertEqual(router.navigationTitle, "Countries")
		router.navigationTitle = "Favorites"
		XCTAssertEqual(router.navigationTitle, "Favorites")
	}
}
