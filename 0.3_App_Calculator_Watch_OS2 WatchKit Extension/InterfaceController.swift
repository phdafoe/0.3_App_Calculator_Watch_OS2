//
//  InterfaceController.swift
//  0.3_App_Calculator_Watch_OS2 WatchKit Extension
//
//  Created by User on 17/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var comidaTotal : Double = 0
    var propinaTotal : Double = 0

    //tip -> Propina
    //meal -> comida
    var comidaCostoArray = [10.0, 15.0, 16.0, 17.0, 18.0, 20.0, 24.0, 25.0, 27.0, 30.0, 35.0, 40.0, 45.0]
    var propinaArray = [0.10, 0.15, 0.20, 0.30, 0.45]
    
    var botonComidaNumero : Int = 0
    var botonPropinaNumero : Int = 0
    
    
    
    //MARK: - IBOUTLET
    
    
    @IBOutlet var myLblTip: WKInterfaceLabel!
    @IBOutlet var myLblTotal: WKInterfaceLabel!
    @IBOutlet var myBtnMealButton: WKInterfaceButton!
    @IBOutlet var myBtnTipButton: WKInterfaceButton!
    
    
    //MARK: - IBACTION
    
    @IBAction func myBtnMealButtonACTION() {
        
        buttonNumberMealTotal()
        calculateTotal()
        
    }

    @IBAction func myBtnTipButtonACTION() {
        
        buttonNumberTipTotal()
        calculateTotal()
        
    }
    
    
    //MARK: - UTILS
    
    
    func buttonNumberMealTotal(){
        
        botonComidaNumero += 1
        
        if botonComidaNumero == comidaCostoArray.count {
            
            botonComidaNumero = 0
        }
        
        printButtons()
        
    }
    
    func buttonNumberTipTotal(){
        
        botonPropinaNumero += 1
        
        if botonPropinaNumero == propinaArray.count{
            
            botonPropinaNumero = 0
        }
        
        
        printButtons()
        
        
    }
    
    func printButtons(){
        
        //PARA METERLE MAS DECIMALES
        /*
        let sComida = String(format: "%0.0f", comidaCostoArray[botonComidaNumero])
        let sPropina = String(format: "%0.0f", propinaArray[botonPropinaNumero] * 100)
        
        myBtnMealButton.setTitle("Meal Total: €\(sComida)")
        myBtnTipButton.setTitle("Tip Total: \(sPropina)")
        
        */

        myBtnMealButton.setTitle("Meal Total: €\(comidaCostoArray[botonComidaNumero])")
        myBtnTipButton.setTitle("Tip Total: \(propinaArray[botonPropinaNumero] * 100)%")
        
    }
    
    
    func calculateTotal(){
        
        
        propinaTotal = comidaCostoArray[botonComidaNumero] * propinaArray[botonPropinaNumero]
        comidaTotal = propinaTotal + comidaCostoArray[botonComidaNumero]
        
        printTip()
        
    }
    
    func printTip(){
        
        myLblTip.setText("Tip: $\(propinaTotal)")
        myLblTotal.setText("Total: $\(comidaTotal)")
        
        
        
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
