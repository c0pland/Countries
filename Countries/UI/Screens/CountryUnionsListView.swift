//
//  CountryUnionsListView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct UnionListView: View {
	@EnvironmentObject private var countryUnionViewModel: CountryUnionViewModel
	
	var body: some View {
		NavigationView {
			VStack {
				List(countryUnionViewModel.unions) { union in
					NavigationLink(destination: CountryUnionDetailView(union: union)) {
						UnionListCell(union: union)
					}
				}
			}
		}
	}
}

struct CountryUnionsListView_Previews: PreviewProvider {
	static var previews: some View {
		let countryUnionViewModel = CountryUnionViewModel()
		countryUnionViewModel.loadData(fileName: "unions")
		return UnionListView()
			.environmentObject(countryUnionViewModel)
	}
}
