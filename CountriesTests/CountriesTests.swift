//
//  CountriesTests.swift
//  CountriesTests
//
//  Created by Богдан Беннер on 29.12.22.
//

import XCTest
import SwiftUI
@testable import Countries

final class CountriesTests: XCTestCase {
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
//	func testPerformanceExample() throws {
//		// This is an example of a performance test case.
//		measure {
//			// Put the code you want to measure the time of here.
//		}
//	}
}

class CountryViewModelTests: XCTestCase {
	let countryViewModel = CountryViewModel()
	let countryUnionViewModel = UnionViewModel()
	func testLoadData() {
		countryViewModel.loadData(fileName: "countries")
		countryUnionViewModel.loadData(fileName: "unions")
		XCTAssertEqual(countryViewModel.countries.count, 249)
	}
	func testLoadDataHandlesFileNotFoundError() {
		countryViewModel.loadData(fileName: "non-existent-file", testing: true)
		countryUnionViewModel.loadData(fileName: "non-existent-file", testing: true)
		XCTAssertEqual(countryViewModel.countries.count, 0)
		XCTAssertEqual(countryUnionViewModel.unions.count, 0)
	}
}

class UnionViewModelTests: XCTestCase {
	let unionViewModel = UnionViewModel()
	let countryViewModel = CountryViewModel()
	func testNatoMember() {
		countryViewModel.loadData(fileName: "countries")
		unionViewModel.loadData(fileName: "unions")
		if let italy = countryViewModel.countries.first(where: { $0.name.common == "Italy" }) {
			let nato = unionViewModel.unions.first { $0.abbreviation == "NATO" }
			XCTAssert(unionViewModel.containsMember(union: nato!, country: italy))
		} else { XCTFail("Failed to get Italy from country list") }
		if let russia = countryViewModel.countries.first(where: { $0.name.common == "Russia" }) {
			let nato = unionViewModel.unions.first { $0.abbreviation == "NATO" }
			XCTAssertFalse(unionViewModel.containsMember(union: nato!, country: russia))
		} else { XCTFail("Failed to get Russia from country list") }
	}
	func testUNMember() {
		countryViewModel.loadData(fileName: "countries")
		unionViewModel.loadData(fileName: "unions")
		if let morocco = countryViewModel.countries.first(where: { $0.name.common == "Morocco" }) {
			let unitedNations = unionViewModel.unions.first { $0.abbreviation.lowercased() == "un" }
			XCTAssert(unionViewModel.containsMember(union: unitedNations!, country: morocco))
		} else { XCTFail("Failed to get Morocco from country list") }
		// Kosovo is NOT a UN member
		if let kosovo = countryViewModel.countries.first(where: { $0.name.common == "Kosovo" }) {
			let unitedNations = unionViewModel.unions.first { $0.abbreviation.lowercased() == "un" }
			XCTAssertFalse(unionViewModel.containsMember(union: unitedNations!, country: kosovo))
		} else { XCTFail("Failed to get Kosovo from country list") }
	}
	func testMemberCount() {
		unionViewModel.loadData(fileName: "unions")
		let randomUnion = unionViewModel.unions.randomElement()!
		XCTAssertEqual(randomUnion.members.count, randomUnion.numberOfMembers)
	}
}

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
