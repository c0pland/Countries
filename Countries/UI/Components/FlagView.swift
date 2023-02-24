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
		//		AsyncImage(url: URL(string: "https://www.countryflagsapi.com/png/\(country.cca3.lowercased())")!) { phase in // 1
		//			if let image = phase.image { // 2
		//				// if the image is valid
		//				image
		//					.resizable()
		//				//										   .aspectRatio(contentMode: .fill)
		//					.border(.black, width: 2)
		//					.frame(width: 300, height: 200)
		//
		//			} else if phase.error != nil { // 3
		//				// some kind of error appears
		//				Text("No image available")
		//					.bold()
		//					.font(.title)
		//					.multilineTextAlignment(.center)
		//
		//			} else { // 4
		//				// showing progress view as placeholder
		//				ProgressView()
		//					.font(.largeTitle)
		//			}
		//		}
		//		.padding()
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
