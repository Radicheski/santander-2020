//
//  File.swift
//  TransicaoTela
//
//  Created by Erik Radicheski da Silva on 25/09/20.
//

import UIKit

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailVC viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("DetailVC viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("DetailVC viewDidAppear")
    }
    
}
