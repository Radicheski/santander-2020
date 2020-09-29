//
//  AddressViewController.swift
//  TransicaoTela
//
//  Created by Erik Radicheski da Silva on 28/09/20.
//

import UIKit

class AddressViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: ReturnAddress?

    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var neighborhoodInput: UITextField!
    @IBOutlet weak var cityInput: UITextField!
    @IBOutlet weak var stateInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addressInput.delegate =  self
        self.numberInput.delegate =  self
        self.neighborhoodInput.delegate =  self
        self.cityInput.delegate =  self
        self.stateInput.delegate =  self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (!isValidEntry(textField)) {
            return false
        }
        
        switch(textField) {
        case self.addressInput:
            self.numberInput.becomeFirstResponder()
        case self.numberInput:
            self.neighborhoodInput.becomeFirstResponder()
        case self.neighborhoodInput:
            self.cityInput.becomeFirstResponder()
        case self.cityInput:
            self.stateInput.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func isValidEntry(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        return text.count > 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let address: Address = Address(address: self.addressInput.text ?? "",
                                       number: self.numberInput.text ?? "",
                                       neighborhood: self.neighborhoodInput.text ?? "",
                                       city: self.cityInput.text ?? "",
                                       state: self.stateInput.text ?? "")
        
        self.delegate?.returnAddress(address)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
