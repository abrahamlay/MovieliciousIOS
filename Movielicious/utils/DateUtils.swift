//
//  ImageUtils.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 30/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import Foundation

func dateFormaterUtils(dateString:String) -> String{
    let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "E, d MMM y"
            return formatter.string(from: date)
        } else {
            return dateString
        }
}
