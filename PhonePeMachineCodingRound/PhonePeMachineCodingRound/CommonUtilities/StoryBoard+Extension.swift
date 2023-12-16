//
//  StoryBoard+Extension.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation
import UIKit

public protocol StoryboardInstantiable: NSObjectProtocol {
	associatedtype T
	static var defaultFileName: String { get }
	static func instantiateViewController(_ bundle: Bundle?) -> T
}

public extension StoryboardInstantiable where Self: UIViewController {
	static var defaultFileName: String {
		return NSStringFromClass(Self.self).components(separatedBy: ".").last!
	}
	
	static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
		let fileName = defaultFileName
		let storyboard = UIStoryboard(name:  NSStringFromClass(Self.self).components(separatedBy: ".").last!, bundle: bundle)
		guard let vc = storyboard.instantiateInitialViewController() as? Self else {
			
			fatalError("Cannot instantiate initial view controller \(Self.self) from storyboard with name \(fileName)")
		}
		return vc
	}
}

