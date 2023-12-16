//
//  VenuRequestModel.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation


struct VenueRequestModel : Codable {
	
	var per_page : Int?
	var page : Int?
	var client_id : String?
	var lat : Double?
	var lon : Double?
	
	
}
