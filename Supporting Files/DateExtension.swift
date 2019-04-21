//
//  DateExtension.swift
//  ContactInporterSampleProj
//
//  Created by Ivan Ramirez on 4/20/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation

extension Date {
    var asString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        
        return formatter.string(from: self)
    }
}
