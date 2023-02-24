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
		VStack {
			HStack {
				Text(union.fullName)
					.font(.body)
				Spacer()
				Image("\(union.abbreviation.lowercased())-emblem")
					.resizable()
					.frame(width: 40, height: 40)
			}
		}
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
