//
//  CountryUnionsListView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct CountryUnionsListView: View {
	@EnvironmentObject private var countryUnionViewModel: CountryUnionViewModel
	
    var body: some View {
		NavigationView {
			VStack {
				List(countryUnionViewModel.unions) { union in
					NavigationLink(destination: CountryUnionDetailView(union: union)) {
						CountryUnionCellView(union: union)
					}
				}
			}
		}
    }
}

struct CountryUnionsListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryUnionsListView()
    }
}
