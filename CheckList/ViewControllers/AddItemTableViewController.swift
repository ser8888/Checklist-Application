//
//  AddItemTableViewController.swift
//  CheckList
//
//  Created by Sergejs Tiselskis on 17/07/2022.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
//    var delegate: AddItemViewController!
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        //Never show large titles.
        navigationItem.largeTitleDisplayMode = .never
        

    }
    
    
    
    
   
    // MARK: - Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done() {
        
        print("Contents of the text field: \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
    
    //Disable selection of the raw during editing it.
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    //Bring up the keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    //MARK: - Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
//        if newText.isEmpty {
//            doneBarButton.isEnabled = false
//        } else {
//            doneBarButton.isEnabled = true
//        }
        doneBarButton.isEnabled = !newText.isEmpty
        return true
        
        
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
    
    
}
