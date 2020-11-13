//
//  AnimationButtonExtension.swift
//  Calculator
//
//  Created by José Eduardo Rodríguez Reyes on 06/11/20.
//

import UIKit

private let orange = UIColor(red: 254/253, green: 148/255, blue: 6/255, alpha: 1)

extension UIButton {
 //  BORDO REDONDO
     func round()   {
        layer.cornerRadius = bounds.height / 2.2
         clipsToBounds = true
     }
     
 //    ANIMACION DE REBOTE
     func bounce()  {
         UIView.animate(withDuration: 0.2, animations: {
             self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
             
         }) { (completion) in
             UIView.animate(withDuration: 0.1, animations: {
                 self.transform = .identity
             })
         }
     }
     
 //    SHINE
     func shine() {
         UIView.animate(withDuration: 0.1, animations: {
             self.transform = CGAffineTransform(scaleX: 1, y: 1)
             self.alpha = 0.5
         }) { (completion) in
             UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
             })
         }
     }
     
    func selectOperation(_ selected:Bool){
        backgroundColor = selected ? .white : orange
        setTitleColor(selected ? orange: .white, for: .normal)
        
    }
     
 }

