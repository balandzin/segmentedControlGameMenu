//
//  ViewController.swift
//  segmentedControlGameMenu
//
//  Created by Антон Баландин on 11.09.23.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var heroImageView: UIImageView!
    
    var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items = ["Olgerd", "Wizard", "Magus"]
        segmentedControl = UISegmentedControl(items: items)
        
        heroImageView.contentMode = .scaleAspectFit
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 22)!, NSAttributedString.Key.foregroundColor: UIColor.purple], for: .selected)
        
        segmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)
        
        segmentedControl.selectedSegmentIndex = 0
        
        setupViews()
        
    }
    
    private func setupViews(){
        view.addSubview(segmentedControl)
        setupConstraints()
    }
    
    private func setupConstraints() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
                       
            segmentedControl.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    @objc func segmentedAction(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0: changeHero(for: 1)
        case 1: changeHero(for: 2)
        case 2: changeHero(for: 3)
        default: break
        }
    }
    
    func changeHero(for index: Int) {
        UIView.animate(withDuration: 0.5, animations: {
            self.heroImageView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.heroImageView.alpha = 1
                self.heroImageView.image = UIImage(named: "\(index)")!
            }
        }
    }
}

