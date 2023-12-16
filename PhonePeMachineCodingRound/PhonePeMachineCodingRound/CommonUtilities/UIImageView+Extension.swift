//
//  UIImageView+Extension.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation
import UIKit

extension UIImageView {
	func load(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
}
