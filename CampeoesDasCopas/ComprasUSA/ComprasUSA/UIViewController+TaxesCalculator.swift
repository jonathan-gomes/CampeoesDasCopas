//
//  UIViewController+TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Jonathan Gomes on 12/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import Foundation
import  UIKit

extension UIViewController {
    var tc: TaxesCalculator {
        return TaxesCalculator.shared
    }
}
