//
//  ViewController.swift
//  Calculator
//
//  Created by José Eduardo Rodríguez Reyes on 05/11/20.
//

import UIKit

class ViewController: UIViewController {

//    OUTLETS
    
    @IBOutlet weak var resultLabel: UILabel!
    
//      NUMBERS
    
    @IBOutlet weak var numberZero: UIButton!
    @IBOutlet weak var numberOne: UIButton!
    @IBOutlet weak var numbertwo: UIButton!
    @IBOutlet weak var numberThree: UIButton!
    
    @IBOutlet weak var numberFour: UIButton!
    @IBOutlet weak var numberFive: UIButton!
    @IBOutlet weak var numberSix: UIButton!
    @IBOutlet weak var numberSeven: UIButton!
    @IBOutlet weak var numberEight: UIButton!
    @IBOutlet weak var numberNine: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
//      OPERATORS
    
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPorcent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAdition: UIButton!
    @IBOutlet weak var operatorSustraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        PROPIEDADES DE REDONDEO
        numberZero.round()
        numberOne.round()
        numbertwo.round()
        numberThree.round()
        numberFour.round()
        numberFive.round()
        numberSix.round()
        numberSeven.round()
        numberEight.round()
        numberNine.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPorcent.round()
        operatorResult.round()
        operatorAdition.round()
        operatorSustraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
        
    }
//      BUTTON ACTIONS
    
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorPorcentAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorResultAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorAditionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorSustractionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()
    }
//    EN ESTA FUNCION IRAN TODOS LOS NUMEROS INCLUIDOS
//    SOLO SE LLAMARAN UNA VEZ, ESO FUE CON LA AYUDA DEL TAG
    @IBAction func numberAction(_ sender: UIButton) {
        sender.shine()
        print(sender.tag)
    }
    
}

