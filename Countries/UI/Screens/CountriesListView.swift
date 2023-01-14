//
//  CountriesListView.swift
//  Countries
//
//  Created by Богдан Беннер on 9.01.23.
//

import SwiftUI

struct CountriesListView: View {
	@ObservedObject private var countryViewModel = CountryViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				List(countryViewModel.countries) { country in
					NavigationLink(destination: CountryDetailView(country: country)) {
						CountryCellView(country: country)
					}
				}
			}
		}
		.navigationTitle("Countries")
	}
	
	init() {
		countryViewModel.loadData(fileName: "countries")
	}
}

struct CountriesListView_Previews: PreviewProvider {
	static var previews: some View {
		CountriesListView()
	}
}
