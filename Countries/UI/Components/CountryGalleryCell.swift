//
//  CountryGalleryCell.swift
//  Countries
//
//  Created by Богдан Беннер on 28.04.23.
//

import SwiftUI

struct CountryGalleryCell: View {
	let country: Country
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.green)
			Text("\(country.flag) \(country.name.common)")
				.font(.title3)
				.bold()
				.foregroundColor(.white)
				.padding()
		}
		.frame(width: 200, height: 80)
	}
}

struct CountryGalleryCell_Previews: PreviewProvider {
	static var previews: some View {
		let countryViewModel = CountryViewModel()
		countryViewModel.loadData(fileName: "countries")
		return CountryGalleryCell(country: countryViewModel.countries.randomElement()!)
	}
}
