//
//  ViewController.swift
//  Calculo
//
//  Created by Jonathan Casillas on 24/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    //outlet
    @IBOutlet weak var myResult: UILabel!
    @IBOutlet weak var mySales: UILabel!
    @IBOutlet weak var myAmount: UITextField!
    @IBOutlet weak var myPercentage: UITextField!
    
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //special Functions
    
    @objc func keyboardUp () {
        
        let heigthScreen = UIScreen.main.nativeBounds.height
        if heigthScreen <= 1136 {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y = -50
            }
        }
    }
    
    @objc func keyboardDown() {
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //buttons Functions
    @IBAction func myCalculate(_ sender: UIButton) {
        guard let cantidad = myAmount.text else { return }
        guard let porcentaje = myPercentage.text else { return }
        
        let cant = (cantidad as NSString).floatValue
        let porciento = (porcentaje as NSString).floatValue
        
        let desc = cant * porciento/100
        let res = cant - desc
        
        myResult.text = "$\(res)"
        mySales.text = "$\(desc)"
        self.view.endEditing(true)
    }
    
    @IBAction func mybuttonCleaner(_ sender: Any) {
        myResult.text = "$0.00"
        mySales.text = "$0.00"
        myAmount.text = ""
        myPercentage.text = ""
    }
    

}

