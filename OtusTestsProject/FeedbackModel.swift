//
//  FeedbackModel.swift
//  OtusTestsProject
//
//  Created by Murzin Mikhail on 10.11.2019.
//  Copyright © 2019 Murzin Mikhail. All rights reserved.
//

import Foundation

struct FeedbackModel {
    let firstName: String?
    let lastName: String?
    let email:String?
    let message: String?
    
    var fullName: String? {
        get {
            return (firstName ?? "") + " " + (lastName ?? "")
        }
    }
}
