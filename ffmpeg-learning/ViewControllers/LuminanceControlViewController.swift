//
//  LuminanceControlViewController.swift
//  ffmpeg-learning
//
//  Created by resober on 2019/4/26.
//  Copyright © 2019 resober. All rights reserved.
//

import UIKit

class LuminanceControlViewController: OneSlideBaseViewController {

    let linearSwitch = UISwitch();
    let mgr = FiltersManager();
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilters();
    }

    final func setupFilters() {
        
    }

    final override func setupViews() {
        super.setupViews();
        linearSwitch.isOn = false;
        let topMargin:CGFloat = 20.0;
        let top:CGFloat = slide.frame.origin.y + slide.frame.size.height + topMargin;
        linearSwitch.frame = CGRect.init(x: slide.frame.origin.x, y: top, width: 100.0, height: 44.0);
        linearSwitch.addTarget(self, action: #selector(switchValueChanged(sender:)), for: UIControl.Event.valueChanged);
        view.addSubview(linearSwitch);
    }

    final override func slideValueChanged(sender: UISlider) {

    }

    @objc final func switchValueChanged(sender:UISlider) {

    }
}
