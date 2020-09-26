//
//  ViewController.swift
//  TransicaoTela
//
//  Created by Erik Radicheski da Silva on 23/09/20.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("viewDidLoad")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisppaer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }

    @IBAction func segueToDetailVC(_ sender: UIButton) {
        self.performSegue(withIdentifier: "FirstVCToDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: DetailVC? = segue.destination as? DetailVC
        vc?.view.backgroundColor = .red
        vc?.label.text = "Rodaaa!!"
    }
    
}

