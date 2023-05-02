//
//  UnionViewModelTests.swift
//  CountriesTests
//
//  Created by Богдан Беннер on 7.04.23.
//

import XCTest
@testable import Countries

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
	func testMembers() {
		unionViewModel.loadData(fileName: "unions")
		let randomUnion = unionViewModel.unions.randomElement()!
		let members = unionViewModel.getMembers(for: randomUnion)
		XCTAssertEqual(members.count, randomUnion.numberOfMembers)
		for index in members.indices {
			XCTAssertTrue(randomUnion.members.contains(members[index].name.common))
		}
	}
}
