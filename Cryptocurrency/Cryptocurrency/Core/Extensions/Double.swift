//
//  Double.swift
//  Cryptocurrency
//
//  Created by Taoufiq El Moutaouakil  12/4/2024.
//

import Foundation

extension Double {

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
            if let formattedString = currencyFormatter.string(from: number) {
                return formattedString
            } else {
                return "0.00"
        }
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
