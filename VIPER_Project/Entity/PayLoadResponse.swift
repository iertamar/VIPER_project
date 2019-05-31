//
//  PayLoadResponse.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 09/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

struct PayLoadResponse: Decodable {
    struct Payload: Decodable {
        let title: String
        let showGarage: Bool
        let forms: [Config]
    }
    struct Config: Decodable {
        let id: String
        let title: String
        let fields: [Field]
        let ctaText: String
    }
    struct Field: Decodable {
        let id: String
        var displayName: String
        let data: [YearField]?
        let dependsOn: [String]?
    }
    struct YearField: Decodable {
        let label: String
    }
    let payload: Payload
}

