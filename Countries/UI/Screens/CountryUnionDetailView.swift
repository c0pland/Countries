//
//  CountryUnionDetailView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct CountryUnionDetailView: View {
	@EnvironmentObject private var countryUnionViewModel: CountryUnionViewModel
	
	let union: CountryUnion
    var body: some View {
		Text(union.fullName)
    }
}

struct CountryUnionDetailView_Previews: PreviewProvider {
    static var previews: some View {
		let countryUnionViewModel = CountryUnionViewModel()
		CountryUnionDetailView(union: countryUnionViewModel.unions[0])
    }
}
