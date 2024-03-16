//
//  String+Ext.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-16.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        
        let emailFormat = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
        
    }
}
