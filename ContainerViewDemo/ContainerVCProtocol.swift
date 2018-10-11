//
//  ContainerVCProtocol.swift
//  ContainerViewDemo
//
//  Created by Kevin Yu on 10/11/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

// ************************
// parent must adopt:
// ************************

protocol ContainerVCProtocol: class {
    func didSelectContainerOption(_ option: String)
}

// ************************
// children must adopt:
// ************************

protocol ImageContainerProtocol: class {
    var delegate: ContainerVCProtocol! {get set}
    func changePicture(_ imageName: String)
}

protocol TableContainerProtocol: class {
    var delegate: ContainerVCProtocol! {get set}
}
