//
//  ModalPayLoadRes.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 09/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

struct ModelPayLoadRes: Decodable {
    struct Payload: Decodable {
        let data: [ModelField]
    }
    struct ModelField: Decodable {
        let id: String
        let label: String
    }
    let payload: Payload
}
