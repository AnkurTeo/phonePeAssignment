//
//  VenuListViewModel.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//  Copyright (c) 2023 All rights reserved.
//

import Foundation

protocol VenuListViewModelInput {
    func viewDidLoad()
	var view : VenuListViewControllerProtocol? { get set }
}

protocol VenuListViewModelOutput {
	var venues : [Venue] { get set }
	var venuesInteractor : VenuesInteractorProtocol {get set}
	func getVenues()
	var lat : Double? { get set }
	var long : Double? { get set }
}

protocol VenuListViewModelProtocol: VenuListViewModelInput, VenuListViewModelOutput { }

class VenuListViewModel: VenuListViewModelProtocol {
	var lat: Double? = 12.971599
	var long: Double? = 77.594566
	
	weak var view: VenuListViewControllerProtocol?
	var venues = [Venue]()
	var venuesInteractor: VenuesInteractorProtocol
	
	init(venuesInteractor : VenuesInteractorProtocol) {
		self.venuesInteractor = venuesInteractor
	}
	
	func getVenues() {
		let venueRequestModel = VenueRequestModel(per_page: 10, client_id: AppConfiguration.clientId, lat : lat, lon: long)
		self.venuesInteractor.getVenues(venueRequestModel: venueRequestModel) { [weak self] venue in
			self?.venues = venue.venues ?? []
			self?.view?.loadVenues(venues: venue.venues ?? [])
		} apiFailure: { failureDict in
			print("failure")
		} otherError: { error in
			print("other error")
		}
	}
}

// MARK: - INPUT. View event methods
extension VenuListViewModel {
    func viewDidLoad() {
    }
}
