//
//  RadioButton.swift
//  WizardTwo
//
//  Created by Daniel Hjartstrom on 25/04/2017.
//  Copyright © 2017 Daniel Hjartstrom. All rights reserved.
//

import UIKit

protocol RadioButtonDelegate {
    
    func didPressButton(sender: RadioButton)
    
}

class RadioButton: UIButton {

    var checked: Bool = false
    var delegate: RadioButtonDelegate?
    
    init(frame: CGRect, checked: Bool, title: String, index: Int) {
        super.init(frame: frame)
        
        self.checked = checked
        self.tag = index
        
        self.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        self.setTitleColor(UIColor.darkGray, for: .normal)
        self.setTitle(title, for: .normal)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .left
        self.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)

        index == 0 ? setSelected() : setUnselected()
    }
    
    func setSelected(){
    
        self.setImage(UIImage(named: "checked"), for: .normal)
        self.checked = true
    
    }
    
    func setUnselected(){

        self.setImage(UIImage(named: "unchecked"), for: .normal)
        self.checked = false
    
    }
    
    func buttonPressed(sender: UIButton){
        self.delegate?.didPressButton(sender: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

}
