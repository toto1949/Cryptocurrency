//
//  UIApplication.swift
//  Cryptocurrency
//
//  Created by Taoufiq El Moutaouakil  12/4/2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
