//
//  MainViewController.swift
//  ContainerViewDemo
//
//  Created by Kevin Yu on 10/11/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: Storyboard Outlets
    
    @IBOutlet var imageContainerView: UIView!
    @IBOutlet var tableContainerView: UIView!
    
    @IBOutlet var swapButton: UIButton!
    
    // MARK: Child Container ViewControllers
    
    weak var imageContainer: ImageContainerProtocol!
    weak var tableContainer: TableContainerProtocol!
    
    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // connect container viewControllers to self
        imageContainer = children.first(where: { $0 is ImageContainerProtocol }) as? ImageContainerProtocol
        tableContainer = children.first(where: { $0 is TableContainerProtocol }) as? TableContainerProtocol
        imageContainer.delegate = self
        tableContainer.delegate = self
        
        swapButton.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func swapButtonAction(_ sender: Any) {
        // fun animation
        UIView.animate(withDuration: 1.0, animations: { [unowned self] in
            (self.imageContainerView.frame, self.tableContainerView.frame) = (self.tableContainerView.frame, self.imageContainerView.frame)
        }) { (completed) in
            // 
        }
    }
    
}

extension MainViewController: ContainerVCProtocol {
    
    // parent handles communication between children
    func didSelectContainerOption(_ option: String) {
        imageContainer.changePicture(option)
    }
}

