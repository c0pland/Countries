//
//  CountryUnionCellView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct CountryUnionCellView: View {
	@EnvironmentObject private var countryUnionViewModel: CountryUnionViewModel
	
	let union: CountryUnion
    var body: some View {
		Text(union.abbreviation)
    }
}

struct CountryUnionCellView_Previews: PreviewProvider {
    static var previews: some View {
		let countryUnionViewModel = CountryUnionViewModel()
		CountryUnionCellView(union: countryUnionViewModel.unions[0])
    }
}
