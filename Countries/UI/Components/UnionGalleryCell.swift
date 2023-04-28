//
//  CountryUnionCell.swift
//  Countries
//
//  Created by Богдан Беннер on 3.02.23.
//

import SwiftUI

struct UnionGalleryCell: View {
	let union: Union
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.blue)
			HStack {
				Image("\(union.abbreviation.lowercased())-emblem")
					.resizable()
					.scaledToFit()
				Text(union.abbreviation)
					.font(.title3)
					.bold()
					.foregroundColor(.white)
			}
			.padding()
		}
		.frame(width: 200, height: 80)
    }
}

struct CountryUnionCell_Previews: PreviewProvider {
    static var previews: some View {
		let countryUnionViewModel = UnionViewModel()
		countryUnionViewModel.loadData(fileName: "unions")
		return UnionGalleryCell(union: countryUnionViewModel.unions.randomElement()!)
    }
}
