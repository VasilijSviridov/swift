//
//  deco.swift
//  gbprates4you
//
//  Created by Wasilij on 01/11/2017.
//  Copyright © 2017 Wasilij. All rights reserved.
//

import Foundation


struct OptionsOfArray: Decodable {
    let one: String
    let two: String
    let three: String
    let four: String
}


struct Swifter: Decodable {
    let eur: OptionsOfArray
    let usd: OptionsOfArray
}

