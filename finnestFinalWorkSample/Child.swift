//
//  Child.swift
//  finnestFinalWorkSample
//
//  Created by Dominick Hera on 10/12/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import Foundation


struct Child {
    let name: String
    let image: String
    let cardBalance: Double
    let nestBalance: Double
    let totalWealth: Double
    var sideBool: Bool
    
    init(name: String, image: String, cardBalance: Double, nestBalance: Double, totalWealth: Double, sideBool: Bool) {
        self.name = name
        self.image = image
        self.cardBalance = cardBalance
        self.nestBalance = nestBalance
        self.totalWealth = totalWealth
        self.sideBool = sideBool
    }
}
