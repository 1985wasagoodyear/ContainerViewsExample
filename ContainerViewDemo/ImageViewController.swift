//
//  ImageViewController.swift
//  ContainerViewDemo
//
//  Created by Kevin Yu on 10/11/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

final class ImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    weak var delegate: ContainerVCProtocol!

}

extension ImageViewController: ImageContainerProtocol {
    
    // change the image when the delegate tells us
    func changePicture(_ imageName: String) {
        if let image = UIImage(named: imageName) {
            imageView.image = image
        }
    }
}
