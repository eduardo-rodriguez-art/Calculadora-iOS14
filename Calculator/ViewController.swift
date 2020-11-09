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
    
    private var total:Double=0 //total
    private var temp:Double = 0 //valor por pantalla
    private var operating=false //indica si se selecciono un OPERADOR
    private var decimal=false //indica si se va a usar tipo decimal
    private var operation: operationType = .none //operacion actual
    
//    CONSTANTES SE INICIAN CON UNA K
//    asi se toma el idioma y region del celular
    private let kDecimalSeparator = Locale.current.decimalSeparator
    private let kMaxLength = 9
    private let kMaxValue:Double = 999999999
    private let kMinValue: Double = 0.00000001
    
    private enum operationType {
        case none
        case suma
        case resta
        case multiplicacion
        case division
        case porcentaje
    }
    
//                     SEPARADORES
    
//    FORMATEO POR VALOR DE TIPO CIENTIFICO
    private let printScientifcFormatter: NumberFormatter = {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    
    
//    FORMATEO DE VALORES AUXILIAR
    
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
        
    }()
    
//    FORMATEO DE VALORES POR PANTALLA POR DEFECTO
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumIntegerDigits = 0 //numeros decimales que puede tener como minimo
        formatter.maximumFractionDigits = 8 //numeros decimales que puede tener como maximo
        
        return formatter
        
    }()
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
        
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        result() //para que se vea por pantalla
        
    }
//      BUTTON ACTIONS
    
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        clear()
        sender.shine()
    }
//    Este action cambia de signo el valor ingresado
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    @IBAction func operatorPorcentAction(_ sender: UIButton) {
        if operation != .porcentaje{
            result()
        }
        
        operating = true
        operation = .porcentaje
        result()
        
        sender.shine()
    }
    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    @IBAction func operatorAditionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .suma
        sender.shine()
    }
    @IBAction func operatorSustractionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .resta
        sender.shine()
    }
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .multiplicacion
        sender.shine()
    }
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .division
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))
        if !operating && currentTemp!.count > kMaxLength{ //que se paso del limite de decimales respetados
            return
        }
        
        resultLabel.text = resultLabel.text! + kDecimalSeparator!
        decimal = true
        sender.shine()
    }
//    EN ESTA FUNCION IRAN TODOS LOS NUMEROS INCLUIDOS
//    SOLO SE LLAMARAN UNA VEZ, ESO FUE CON LA AYUDA DEL TAG
    @IBAction func numberAction(_ sender: UIButton) {
        operatorAC.setTitle("C", for: .normal)
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))
        if !operating && currentTemp!.count >= kMaxLength { //que se paso del limite de decimales respetados
            return
        }
        
//        Hemos selecionado una operacion
        if operating{
            total = total==0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating =  false
        }
        
//        Hemos seleccionado decimales
        if decimal{
            currentTemp = currentTemp! + kDecimalSeparator!
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp!+String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
        
    }
    
//    SE CREAN 2 FUNCIONES UNA LIMPIA EL RESULTADO Y RESETEA
//    LA SEGUNDA
    
    
//    Esta funcion formatea el resultado
    private func clear(){
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        
        if temp != 0{
            temp = 0
            resultLabel.text = "0"
            
        }else{
            total = 0
            result()
        }
    }
    
//    Obtiene el resultado final
    private func result(){
        switch operation {
        
        case .none:
//            No hacemos nada
            break
        case .suma:
            total = total+temp
            break
        case .resta:
            total = total-temp
            break
        case .multiplicacion:
            
            total = total*temp
            break
        case .division:
            
            total = total/temp
            break
        case .porcentaje:
            temp = temp/100
            total = temp
            break
        }
        
        if total <= kMaxValue || total >= kMinValue{
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
            
        }
//        print("Total: \(total)")
    }
    
}

