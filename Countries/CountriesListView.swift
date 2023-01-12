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
		   if countryViewModel.isLoading {
			   Text("Loading...")
		   } else {
			   List(countryViewModel.countries) { country in
				   Text("\(country.name.common) \(country.flag)")
			   }
		   }
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
