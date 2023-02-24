//
//  CountryUnionCellView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct UnionListCell: View {
	@EnvironmentObject private var countryUnionViewModel: UnionViewModel
	
	let union: Union
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.blue)
			HStack {
				Image(union.abbreviation.lowercased())
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

struct CountryUnionCellView_Previews: PreviewProvider {
    static var previews: some View {
		let countryUnionViewModel = UnionViewModel()
		countryUnionViewModel.loadData(fileName: "unions")
		return UnionListCell(union: countryUnionViewModel.unions.randomElement()!)
			.environmentObject(countryUnionViewModel)
    }
}
