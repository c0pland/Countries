//
//  CountryUnionsListView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct UnionListView: View {
	@EnvironmentObject private var countryUnionViewModel: UnionViewModel
	@EnvironmentObject private var router: Router
	
	var body: some View {
		List(countryUnionViewModel.unions) { union in
			UnionListCell(union: union)
				.onTapGesture {
					router.unionsPath.append(union)
				}
				.id(ScrollAnchor.unions)
		}
		.navigationDestination(for: Union.self) { union in
			UnionDetailView(union: union)
		}
		.navigationTitle(router.navigationTitle)
	}
}

struct UnionListView_Previews: PreviewProvider {
	static var previews: some View {
		let countryUnionViewModel = UnionViewModel()
		countryUnionViewModel.loadData(fileName: "unions")
		return UnionListView()
			.environmentObject(countryUnionViewModel)
			.environmentObject(Router())
	}
}
