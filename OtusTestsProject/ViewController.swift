//
//  ViewController.swift
//  OtusTestsProject
//
//  Created by Murzin Mikhail on 10.11.2019.
//  Copyright © 2019 Murzin Mikhail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let successStatus = "Feedback was sent"
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var statusLabel: UILabel!
    
    private let validator = FeedbackValidator()
    
    @IBAction func sendFeedbackClick(_ sender: Any) {
        let model = FeedbackModel(firstName: firstNameField.text, lastName: lastNameField.text, email: emailField.text, message: messageTextView.text)
        do {
            try validator.validateModel(model)
            statusLabel.text = ViewController.successStatus
        } catch FeedbackValidator.FeedbackError.emptyFirstName {
             showAlertDialog(FeedbackValidator.FeedbackError.emptyFirstName)
        } catch FeedbackValidator.FeedbackError.emptyLastName {
            showAlertDialog(FeedbackValidator.FeedbackError.emptyLastName)
        } catch FeedbackValidator.FeedbackError.emptyEmail {
            showAlertDialog(FeedbackValidator.FeedbackError.emptyEmail)
        } catch FeedbackValidator.FeedbackError.invalidEmail {
            showAlertDialog(FeedbackValidator.FeedbackError.invalidEmail)
        } catch FeedbackValidator.FeedbackError.insufficientMessageText {
            showAlertDialog(FeedbackValidator.FeedbackError.insufficientMessageText)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMessageTextBorder()
    }
    
    private func setupMessageTextBorder(){
        messageTextView.layer.cornerRadius = 5
        messageTextView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        messageTextView.layer.borderWidth = 0.8
        messageTextView.clipsToBounds = true
    }
    
    private func showAlertDialog(_ error: FeedbackValidator.FeedbackError){
        let message = validator.getErrorMessage(error)
        let alert = UIAlertController(
            title: "Validation error",
            message: message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true)
    }


}

