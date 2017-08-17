//
//  RadioActive.swift
//  WizardTwo
//
//  Created by Daniel Hjartstrom on 25/04/2017.
//  Copyright © 2017 Daniel Hjartstrom. All rights reserved.
//

import UIKit

protocol RadioActiveButtonDelegate {
    
    func didSelectButton(number: Int)
    
}

class RadioActive: NSObject, RadioButtonDelegate {

    var delegate: RadioActiveButtonDelegate?
    var buttonArray = [RadioButton]()
    var currentlySelectedOption: Int = 0
    
    func returnViewWithRadioButtons(view: UIView, optionTitles:[String]) -> UIView {
    
        let buttonsView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        let buttonWidth = buttonsView.frame.width
        
        let buttonHeight = buttonsView.frame.height / CGFloat(optionTitles.count)
        
        for (index, title) in optionTitles.enumerated() {
     
            let button = RadioButton(frame: CGRect(x: 0, y: 0 + (buttonHeight * CGFloat(index)), width: buttonWidth, height: buttonHeight), checked: index == 0 ? true : false, title: title, index: index)
                button.delegate = self
            
            buttonArray.append(button)
            buttonsView.addSubview(buttonArray[index])
        }
        
        return buttonsView
    }
    
    // delegate
    func didPressButton(sender: RadioButton) {
        
        self.currentlySelectedOption = sender.tag
        
        if (!sender.checked){
        
            sender.setSelected()
            
            for button in buttonArray {
            
                if button != sender {
                 
                    button.setUnselected()
                    
                }
            }
        }
    }
}
