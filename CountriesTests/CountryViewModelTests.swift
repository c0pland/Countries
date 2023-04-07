//
//  CountryViewModelTests.swift
//  CountriesTests
//
//  Created by Богдан Беннер on 7.04.23.
//
import XCTest
@testable import Countries

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
