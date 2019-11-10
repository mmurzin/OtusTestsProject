//
//  FeedbackValidator.swift
//  OtusTestsProject
//
//  Created by Murzin Mikhail on 10.11.2019.
//  Copyright © 2019 Murzin Mikhail. All rights reserved.
//

import Foundation


class FeedbackValidator {
    
    static let minMessageLength = 10
    enum FeedbackError: Error {
        case emptyFirstName
        case emptyLastName
        case emptyEmail
        case invalidEmail
        case insufficientMessageText
    }
    
    private let errorMessages = [FeedbackError.emptyFirstName: "First name can't be empty",
                                    FeedbackError.emptyLastName: "Last name can't be empty",
                                    FeedbackError.emptyEmail: "Email  can't be empty",
                                    FeedbackError.invalidEmail: "Email isn't valid",
                                    FeedbackError.insufficientMessageText: "Message text should be must be longer than \(FeedbackValidator.minMessageLength) symbols"]
    
    func validateModel(_ model: FeedbackModel) throws {
        if (model.firstName ?? "").isEmpty {
            throw FeedbackError.emptyFirstName
        }
        
        if (model.lastName ?? "").isEmpty {
            throw FeedbackError.emptyLastName
        }
        
        if (model.email ?? "").isEmpty {
            throw FeedbackError.emptyEmail
        }
        
        if (model.message ?? "").count < FeedbackValidator.minMessageLength {
            throw FeedbackError.insufficientMessageText
        }
        
        if !isValidEmail((model.email ?? "")) {
            throw FeedbackError.invalidEmail
        }
    }
    
    func getErrorMessage(_ error: FeedbackError) -> String {
        return errorMessages[error] ?? "Unexpected error"
    }
    
    private func isValidEmail(_ email:String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
