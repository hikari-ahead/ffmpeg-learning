//
//  ViewController.swift
//  ffmpeg-learning
//
//  Created by resober on 2019/4/26.
//  Copyright © 2019 resober. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var commands:[(title:String, class:String)] = [];
    lazy var tableView = {
        return UITableView.init();
    }();

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData();
        setupViews();
    }

    final func setupData() {
        commands = [
            ("亮度调节", NSStringFromClass(LuminanceControlViewController.self))
        ];
    }

    final func setupViews() {
        tableView.frame = self.view.bounds;
        tableView.backgroundColor = .white;
        tableView.delegate = self;
        tableView.dataSource = self;
        view.addSubview(tableView);
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clsStr:String = commands[indexPath.row].class;
        let classType = NSClassFromString(clsStr) as! UIViewController.Type;
        let vc = classType.init();
        if (!vc.isKind(of: UIViewController.self)) {
            print("必须是一个vc");
            return;
        }
        vc.title = commands[indexPath.row].title;
        self.navigationController?.pushViewController(vc, animated: true);
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "ViewControllerTableViewCell");
        cell.textLabel?.text = commands[indexPath.row].title;
        return cell;
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commands.count;
    }
}

