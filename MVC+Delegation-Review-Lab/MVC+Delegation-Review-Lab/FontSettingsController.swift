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
    //default size title 17, sub 12
    //myLabel.font = UIFont.systemFont(ofSize: 16)

    var defaultFontSize: Float = 17
    var currentFontSize: Float = 17 {
        didSet {
            stepperFontControl.value = Double(currentFontSize)
            sliderFontControl.value = currentFontSize
            previewFontLabel.text = "\(currentFontSize)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
        previewFontLabel.text = "Preview Font Size: \(defaultFontSize)"
    }
    
    func configureStepper() {
        stepperFontControl.minimumValue = 1
        stepperFontControl.maximumValue = 80
        stepperFontControl.stepValue = 1
        stepperFontControl.value = 17
    }
    
    func configureSlider()  {
        sliderFontControl.minimumValue = 1
        sliderFontControl.maximumValue = 80
        sliderFontControl.value = 17
    }
    
    @IBAction func exitFontSettings(_ segue: UIStoryboard)   {
        
    }
    
    
    
    @IBAction func stepperChanged(_ sender: UIStepper)  {
        currentFontSize = Float(sender.value).rounded()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        currentFontSize = sender.value.rounded()
    }
}
