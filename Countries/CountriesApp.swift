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
	
	init() {
		self.countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries")
	}
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(countryViewModel)
		}
	}
}
