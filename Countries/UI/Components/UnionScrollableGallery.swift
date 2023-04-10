//
//  RegionScrollableGallery.swift
//  Countries
//
//  Created by Богдан Беннер on 5.02.23.
//

import SwiftUI

struct UnionScrollableGallery: View {
	@EnvironmentObject private var router: Router

	let unions: [Union]
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 20) {
						ForEach(unions, id: \.self) { union in
							CountryUnionGalleryCell(union: union)
								.onTapGesture {
									router.unionsPath.append(union)
									router.selectedTab = Tabs.unions
								}
						}
					}
				}
		.edgesIgnoringSafeArea(.horizontal)
    }
}

struct RegionScrollableGallery_Previews: PreviewProvider {
    static var previews: some View {
		let countryUnionViewModel = UnionViewModel()
		countryUnionViewModel.loadData(fileName: "countryUnions")
		return UnionScrollableGallery(unions: countryUnionViewModel.unions)
    }
}
