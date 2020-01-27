//
//  FontSettingsController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Juan Ceballos on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

protocol FontChangedDelegate: AnyObject {
    func fontChanger(_ fontSize: CGFloat)
}

class FontSettingsController: UIViewController {

   
    @IBOutlet weak var previewFontLabel: UILabel!
    @IBOutlet weak var stepperFontControl: UIStepper!
    @IBOutlet weak var sliderFontControl: UISlider!
    @IBOutlet weak var fontSettingTitle: UILabel!
    
    weak var fontDelegate: FontChangedDelegate?
    //default size title 17, sub 12
    //myLabel.font = UIFont.systemFont(ofSize: 16)

    var defaultFontSize: Float = 34
    
    
    var currentFontSize: Float = 34 {
        didSet {
            fontDelegate?.fontChanger(CGFloat(currentFontSize))
            stepperFontControl.value = Double(currentFontSize)
            sliderFontControl.value = currentFontSize
            previewFontLabel.text = "Preview Font Size: \(currentFontSize)"
            fontSettingTitle.font = UIFont.systemFont(ofSize: CGFloat(currentFontSize))
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
        stepperFontControl.value = 34
    }
    
    func configureSlider()  {
        sliderFontControl.minimumValue = 1
        sliderFontControl.maximumValue = 80
        sliderFontControl.value = 34
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
