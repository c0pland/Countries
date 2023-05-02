//
//  UnionEmblem.swift
//  Countries
//
//  Created by Богдан Беннер on 23.02.23.
//

import SwiftUI

struct UnionEmblem: View {
	@EnvironmentObject private var unionViewModel: UnionViewModel
	
	let union: Union
	
	var body: some View {
		if let emblemImage = UIImage(named: "\(union.abbreviation.lowercased())-flag") {
			Image(uiImage: emblemImage)
				.resizable()
				.scaledToFit()
				.border(.black)
		} else {
			Image("\(union.abbreviation.lowercased())-emblem")
				.resizable()
				.scaledToFit()
				.frame(maxHeight: 200)
		}

	}
}

struct UnionEmblem_Previews: PreviewProvider {
	static var previews: some View {
		let unionViewModel = UnionViewModel()
		unionViewModel.loadData(fileName: "unions")
		return UnionEmblem(union: unionViewModel.unions.randomElement()!)
	}
}
