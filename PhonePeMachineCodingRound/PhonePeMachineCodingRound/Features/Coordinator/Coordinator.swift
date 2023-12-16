//
//  Coordinator.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
	var navigationController: UINavigationController { get set }
}

extension Coordinator {
	func appDelegateSharedInstance() -> AppDelegate{
		return UIApplication.shared.delegate as! AppDelegate
	}
}

protocol ParentCoordinator : Coordinator {
	var childCoordinators: [ChildCoordinator]? { get set }
	func start()
	func addChildCoordinator(coordinator: ChildCoordinator)
	func freeChildCoordinator(coordinator: ChildCoordinator)
}


extension ParentCoordinator {
	func addChildCoordinator(coordinator: ChildCoordinator) {
		// only adding if its not in the list
		if !(childCoordinators?.contains { $0 === coordinator  } ?? true) {
			childCoordinators?.append(coordinator)
		}
		coordinator.parentCoordinator = self
	}
	
	func freeChildCoordinator(coordinator: ChildCoordinator) {
		childCoordinators = childCoordinators?.filter { $0 !== coordinator }
	}
}


protocol ChildCoordinator : Coordinator {
	var parentCoordinator : ParentCoordinator? { get set }
	func start()
	func removeFromParentCoordinator()
}


extension ChildCoordinator {
	func removeFromParentCoordinator() {
		self.parentCoordinator?.freeChildCoordinator(coordinator: self)
	}
}
