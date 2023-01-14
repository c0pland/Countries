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
	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		measure {
			// Put the code you want to measure the time of here.
		}
	}
}

class CountryViewModelTests: XCTestCase {
	func testLoadData() {
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries")
		XCTAssertEqual(countryViewModel.countries.count, 250)
	}
	func testLoadDataHandlesFileNotFoundError() {
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "non-existent-file")
		XCTAssertEqual(countryViewModel.countries.count, 0)
	}
}
