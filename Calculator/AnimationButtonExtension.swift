//
//  AnimationButtonExtension.swift
//  Calculator
//
//  Created by José Eduardo Rodríguez Reyes on 06/11/20.
//

import UIKit

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
     
     

 }

