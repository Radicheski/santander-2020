//
//  UserViewController.swift
//  TransicaoTela
//
//  Created by Erik Radicheski da Silva on 28/09/20.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate, ReturnAddress {
    
    @IBOutlet weak var addressStack: UIStackView!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var cpfInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var birthInput: UITextField!
    
    @IBOutlet weak var addressButton: UIButton!
    
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var neighborhoodInput: UITextField!
    @IBOutlet weak var cityInput: UITextField!
    @IBOutlet weak var stateInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameInput.delegate = self
        self.cpfInput.delegate = self
        self.emailInput.delegate = self
        self.birthInput.delegate = self
        // Do any additional setup after loading the view.
        
        self.addressButton.layer.cornerRadius = 50
    }
    
    @IBAction func adressScreen(_ sender: UIButton) {
        self.performSegue(withIdentifier: "UserToAdress", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: AddressViewController? = segue.destination as? AddressViewController
        vc?.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (!isValidEntry(textField)) {
            return false
        }
        
        switch(textField) {
        case self.nameInput:
            if(isValidName(textField.text ?? "")){
                self.cpfInput.becomeFirstResponder()
            }else{
                textField.text = ""
            }
        case self.cpfInput:
            if(isValidCPF(textField.text ?? "")){
                self.emailInput.becomeFirstResponder()
            }else{
                textField.text = ""
            }
        case self.emailInput:
            if(isValidEmail(textField.text ?? "")) {
                self.birthInput.becomeFirstResponder()
            }else{
                textField.text = ""
            }
        case self.birthInput:
            if(isValidDate(textField.text ?? "")) {
                textField.resignFirstResponder()
            } else {
                textField.text = ""
            }
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func isValidEntry(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        return text.count > 0
    }
    
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        
//        switch(textField) {
//        case self.nameInput:
//            return !isValidName(textField.text ?? "")
//        case self.cpfInput:
//            return !isValidCPF(textField.text ?? "")
//        case self.emailInput:
//            return !isValidEmail(textField.text ?? "")
//        case self.birthInput:
//            return !isValidDate(textField.text ?? "")
//        default:
//            return false
//        }
//        
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func returnAddress(_ address: Address) {
        
        self.addressInput.text = address.address
        self.numberInput.text = address.number
        self.neighborhoodInput.text = address.neighborhood
        self.cityInput.text = address.city
        self.stateInput.text = address.state
        
        self.addressStack.isHidden = false
        
    }
    
    func isValid(_ string:String, regex: NSRegularExpression?) -> Bool {
        if(regex == nil) {
            return true
        }
        return regex?.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)).count ?? 0 > 0
    }
    
    func isValidDate(_ date: String) -> Bool {
        return isValid(date, regex: try? NSRegularExpression(pattern: "^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$", options: []))
    }
    
    func isValidCPF(_ cpf: String) -> Bool {
        return isValid(cpf, regex: try? NSRegularExpression(pattern: "^[0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2}$", options: []))
    }
    
    func isValidEmail(_ email: String) -> Bool {
        return isValid(email, regex: try? NSRegularExpression(pattern: "^.*@.*[.].*$", options: []))
    }
    
    func isValidName(_ name: String) -> Bool {
        return isValid(name, regex: try? NSRegularExpression(pattern: "^.* .*$", options: []))
    }
    
    
    
}

struct Address {
    
    var address: String
    var number: String
    var neighborhood: String
    var city: String
    var state: String
    
}

protocol ReturnAddress {
    func returnAddress(_ address: Address)
}
