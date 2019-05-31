//
//  MakePayLoadRes.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 09/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

struct MakePayLoadRes: Decodable {
    struct Payload: Decodable {
        let data: [MakeField]
    }
    struct MakeField: Decodable {
        var label: String
    }
    let payload: Payload
}
