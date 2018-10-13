//
//  ChildManager.swift
//  finnestFinalWorkSample
//
//  Created by Dominick Hera on 10/12/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import Foundation

class ChildManager {
    static let shared = ChildManager()
    var childList: [Child] = []
    
    private init() {}

    func getChildData() {
        let cardBalanceArray = [12.23, 27.53, 4.25, 17.38]
        let nestBalanceArray = [32.11, 16.55, 69.27, 122.49]
        let totalWealthArray = [(cardBalanceArray[0] + nestBalanceArray[0]), (cardBalanceArray[1] + nestBalanceArray[1]), (cardBalanceArray[2] + nestBalanceArray[2]), (cardBalanceArray[3] + nestBalanceArray[3])]
        let nameArray = ["James", "Gracie", "Roger", "Barthomelow"]
        let imageArray = ["child1", "child2", "child3", "child4"]

        for i in 0...3 {
            let child = Child(name: nameArray[i], image: imageArray[i], cardBalance: cardBalanceArray[i], nestBalance: nestBalanceArray[i], totalWealth: totalWealthArray[i], sideBool: true)
            childList.append(child)
        }
    }
}
