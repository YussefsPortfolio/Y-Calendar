//
//  AddEvent.swift
//  Y-Calendar
//
//  Created by Yussef Arsalan on 08.03.25.
//

import UIKit

class AddEvent: UIViewController{
    
    // Selectable Date
    var selectedDate: Date?
    
    // Func for naming the event
    private let titleTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Title"
           textField.borderStyle = .roundedRect
           return textField
       }()
       
       // Textfield (event Discreption)
       private let descriptionTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Description"
           textField.borderStyle = .roundedRect
           return textField
       }()
       
       // Textfield (Event Location)
       private let locationTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Location"
           textField.borderStyle = .roundedRect
           return textField
       }()
       
       // Button for saving the event
       private let saveButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Save", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.backgroundColor = UIColor(hex: "#931621") // Carmine
           button.layer.cornerRadius = 5
           button.addTarget(self, action: #selector(saveEvent), for: .touchUpInside)
           return button
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           
           // StackView for buttons (doesnt work properly right now)
           let stackView = UIStackView(arrangedSubviews: [titleTextField, descriptionTextField, locationTextField, saveButton])
           stackView.axis = .vertical
           stackView.spacing = 20
           stackView.distribution = .fillEqually
           
           view.addSubview(stackView)
           stackView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
           ])
       }
       
       // Method for saving the event
       @objc func saveEvent() {
           guard let title = titleTextField.text, !title.isEmpty,
                 let date = selectedDate else {
               return
           }
           
           let description = descriptionTextField.text
           let location = locationTextField.text
           
           // saves Event
           DataHandling.shared.saveEvent(title: title, date: date, description: description, location: location)
           
           // closes ViewController
           self.dismiss(animated: true, completion: nil)
       }
}
