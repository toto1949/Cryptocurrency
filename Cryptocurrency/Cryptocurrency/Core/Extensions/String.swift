//
//  String.swift
//  Cryptocurrency
//
//  Created by Taoufiq El Moutaouakil  12/4/2024
//

import Foundation

extension String {
    var removingHTMLOccurancies: String {
        return self.replacingOccurrences(of: "<[ˆ>]+>", with: "", options: .regularExpression, range: nil)
    }
}
