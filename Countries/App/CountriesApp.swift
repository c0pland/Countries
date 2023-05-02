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
	@ObservedObject private var unionViewModel: UnionViewModel
	@ObservedObject private var router: Router
	
	init() {
		self.countryViewModel = CountryViewModel()
		self.unionViewModel = UnionViewModel()
		self.router = Router()
		countryViewModel.loadData(fileName: "countries")
		unionViewModel.loadData(fileName: "unions")
	}
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(countryViewModel)
				.environmentObject(unionViewModel)
				.environmentObject(router)
		}
	}
}
