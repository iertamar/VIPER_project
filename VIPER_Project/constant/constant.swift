//
//  constant.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 08/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

typealias payLoadCompletion = (PayLoadResponse?) -> Void
typealias callingAPICompletion = () -> Void
typealias MakePayLoadCompletion = (MakePayLoadRes?) -> Void
typealias ModelPayLoadCompletion = (ModelPayLoadRes?) -> Void
typealias selectedCompletion = (String) -> ()
var constURL: String = "https://www.walmart.com/fitment/electrode/v2"

