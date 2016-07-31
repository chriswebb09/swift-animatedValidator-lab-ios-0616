//
//  Extensions.swift
//  animated-validator-swift
//
//  Created by Christopher Webb-Orenstein on 7/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

extension String {
    var length: Int {
        var i = 0
        for character in self.characters {
            i += 1
        }
        return i
    }
}