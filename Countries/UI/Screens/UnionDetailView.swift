//
//  CountryUnionDetailView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct UnionDetailView: View {
	@EnvironmentObject private var countryUnionViewModel: UnionViewModel
	
	let union: Union
    var body: some View {
		VStack {
			UnionEmblem(union: union)
			Text(union.fullName)
		}
    }
}

struct UnionDetailView_Previews: PreviewProvider {
    static var previews: some View {
		let unionViewModel = UnionViewModel()
		unionViewModel.loadData(fileName: "unions")
		return UnionDetailView(union: unionViewModel.unions.randomElement()!)
    }
}
