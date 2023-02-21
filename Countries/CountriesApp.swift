//
//  CountriesApp.swift
//  Countries
//
//  Created by Богдан Беннер on 29.12.22.
//

import SwiftUI

@main
struct CountriesApp: App {
	@ObservedObject private var countryViewModel: CountryViewModel
	@ObservedObject private var countryUnionViewModel: CountryUnionViewModel
	
	init() {
		self.countryViewModel = CountryViewModel()
		self.countryUnionViewModel = CountryUnionViewModel()
		countryViewModel.loadData(fileName: "countries")
		countryUnionViewModel.loadData(fileName: "unions")
	}
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(countryViewModel)
				.environmentObject(countryUnionViewModel)
		}
	}
}
