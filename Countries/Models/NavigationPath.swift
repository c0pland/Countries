import SwiftUI

final class NavigationPath: ObservableObject {
	@Published var components: [NavigationPathComponent] = []
	
	init(components: [NavigationPathComponent] = []) {
		self.components = components
	}
	
	var current: NavigationPathComponent? {
		components.last
	}
	
	func push(_ component: NavigationPathComponent) {
		components.append(component)
	}
	
	func pop() {
		components.removeLast()
	}
}

struct NavigationPathComponent: Hashable {
	let title: String
	let destination: AnyHashable
}
