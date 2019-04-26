//
//  BaseViewController.swift
//  ffmpeg-learning
//
//  Created by resober on 2019/4/26.
//  Copyright © 2019 resober. All rights reserved.
//

import UIKit

class OneSlideBaseViewController: UIViewController {
    lazy var imageView:UIImageView = {
        let path = Bundle.main.path(forResource: "a5", ofType: "jpg");
        let tmp = UIImageView.init(image: UIImage.init(contentsOfFile: path ?? ""));
        tmp.contentMode = UIView.ContentMode.scaleAspectFill;
        return tmp;
    }();

    let slide = UISlider();

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews();
        view.backgroundColor = .white;
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backItemClicked(sender:)));
    }

    func setupViews() {
        var top:CGFloat = self.navigationController!.navigationBar.frame.size.height;
        if #available(iOS 11.0, *) {
            top += self.navigationController!.view.safeAreaInsets.top;
        }
        imageView.frame = CGRect.init(x: 0, y: top, width: view.frame.size.width, height: view.frame.size.width);
        view.addSubview(imageView);

        let horizMargin:CGFloat = 20.0;
        let topMargin:CGFloat = 50.0;
        let imageViewBottom = imageView.frame.size.height + imageView.frame.origin.y;
        slide.maximumValue = 1;
        slide.minimumValue = 0;
        slide.value = 0.5;
        slide.frame = CGRect.init(x: horizMargin, y: imageViewBottom + topMargin, width: view.frame.size.width - 2 * horizMargin, height: 44.0);
        slide.addTarget(self, action: #selector(slideValueChanged(sender:)), for: UIControl.Event.valueChanged);
        view.addSubview(slide);
    }

    @objc final func backItemClicked(sender:UIBarButtonItem) {
        navigationController?.popViewController(animated: true);
    }

    @objc func slideValueChanged(sender:UISlider) {

    }
}

