//
//  FlagView.swift
//  Countries
//
//  Created by Богдан Беннер on 15.01.23.
//

import SwiftUI

struct FlagView: View {
	let country: Country
	
	var body: some View {
		Image("\(country.cca2.lowercased())")
			.resizable()
			.scaledToFit()
			.padding()
	}
}

struct FlagView_Previews: PreviewProvider {
	static var previews: some View {
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries")
		return FlagView(country: countryViewModel.countries[Int.random(in: 0...150)])
			.previewLayout(.sizeThatFits)
	}
}
