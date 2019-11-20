//
//  FontSettingsController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Juan Ceballos on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class FontSettingsController: UIViewController {
   
    @IBOutlet weak var previewFontLabel: UILabel!
    @IBOutlet weak var stepperFontControl: UIStepper!
    @IBOutlet weak var sliderFontControl: UISlider!
    //stepper
    //slider
    //default size title 17, sub 12
    //myLabel.font = UIFont.systemFont(ofSize: 16)

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureStepper() {
        stepperFontControl.minimumValue = 1
        stepperFontControl.maximumValue = 80
        stepperFontControl.stepValue = 1
        stepperFontControl.value = 0
    }
    
    func configureSlider()  {
        sliderFontControl.minimumValue = 1
        sliderFontControl.maximumValue = 80
        sliderFontControl.value = 0
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper)  {
    
    }
    
    @IBAction func sliderChanged(_sender: UISlider) {
        
    }
    
}
