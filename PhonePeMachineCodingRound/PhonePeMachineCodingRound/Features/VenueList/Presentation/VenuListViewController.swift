//
//  VenuListViewController.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//  Copyright (c) 2023 All rights reserved.
//

import UIKit
import CoreLocation

protocol VenuListViewControllerProtocol : AnyObject {
	func loadVenues(venues : [Venue])
}

class VenuListViewController: UIViewController, StoryboardInstantiable {
    
	@IBOutlet weak var tableView: UITableView!
	var viewModel: VenuListViewModelProtocol!
	
    
    class func create(with viewModel: VenuListViewModelProtocol) -> VenuListViewController {
        let vc = VenuListViewController.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// set up view model
        bind(to: viewModel)
        viewModel.viewDidLoad()
		viewModel.view = self
		
		
		// set up tableView
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: "VenueListCell", bundle: nil), forCellReuseIdentifier: "VenueListCell")
		
		// get venues
		viewModel.getVenues()
    }
    
    func bind(to viewModel: VenuListViewModelProtocol) {

    }
}


extension VenuListViewController : UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.venues.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "VenueListCell",
													   for: indexPath) as! VenueListCell
		cell.setUp(with: viewModel.venues[indexPath.row])
		return cell
	}
}

extension VenuListViewController : VenuListViewControllerProtocol {
	func loadVenues(venues: [Venue]) {
		self.tableView.reloadData()
	}
}
