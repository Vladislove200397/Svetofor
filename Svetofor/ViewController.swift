//
//  ViewController.swift
//  Svetofor
//
//  Created by Vlad Kulakovsky  on 10.03.22.
//

import UIKit

enum CurrentLight {
    case red, yellow,green
}

class ViewController: UIViewController {

    @IBOutlet var redLight: UIView!
    
    @IBOutlet var yellowLight: UIView!
    
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        startButton.layer.cornerRadius = 10
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        print("Размер стороны доступный из viewDidLoad: ", redLight.frame.height)
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
        
        print("Размер стороны доступный из viewWillLayoutSubviews: ", redLight.frame.height)
    }
    
    
    @IBAction func startBUttonPressed() {
        startButton.setTitle("Next", for: .normal)
         
         switch currentLight {
         case .red:
             greenLight.alpha = lightIsOff
             redLight.alpha = lightIsOn
             currentLight = .yellow
         case .yellow:
             redLight.alpha = lightIsOff
             yellowLight.alpha = lightIsOn
             currentLight = .green
         case .green:
             yellowLight.alpha = lightIsOff
             greenLight.alpha = lightIsOn
             currentLight = .red
        }
    }
    
}

