//
//  DataModel.swift
//  Telstra Test
//
//  Created by Regan Russell on 28/3/20.
//  Copyright © 2020 Regan Russell. All rights reserved.
//

import UIKit

// Eample row:
//"title":"Flag",
//"description":null,
//"imageHref":"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"

class DataModel: Decodable, Identifiable {
//    var id = UUID()

    var title: String?
    var description: String?
    var imageHref: String?
    
}
