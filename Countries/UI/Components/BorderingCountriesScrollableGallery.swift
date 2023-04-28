//
//  BorderingCountriesScrollableGallery.swift
//  Countries
//
//  Created by Богдан Беннер on 28.04.23.
//

import SwiftUI

struct BorderingCountriesScrollableGallery: View {
	let countries: [Country]
	@EnvironmentObject private var router: Router
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 20) {
						ForEach(countries, id: \.self) { country in
							CountryGalleryCell(country: country)
								.onTapGesture {
									router.countriesPath.append(country)
									router.selectedTab = Tabs.countries
								}
						}
					}
				}
		.ignoresSafeArea()
	}
}

struct BorderingCountriesScrollableGallery_Previews: PreviewProvider {
    static var previews: some View {
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries")
		let sampleCountries = Array(countryViewModel.countries[0..<10])
		return BorderingCountriesScrollableGallery(countries: sampleCountries)
    }
}
