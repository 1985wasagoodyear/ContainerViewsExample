//
//  ContainerVCProtocol.swift
//  ContainerViewDemo
//
//  Created by Kevin Yu on 10/11/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import Foundation

// ************************
// parent must adopt:
// ************************

protocol ContainerVCProtocol: AnyObject {
    func didSelectContainerOption(_ option: String)
}

// ************************
// children must adopt:
// ************************

protocol ImageContainerProtocol: AnyObject {
    var delegate: ContainerVCProtocol! {get set}
    func changePicture(_ imageName: String)
}

protocol TableContainerProtocol: AnyObject {
    var delegate: ContainerVCProtocol! {get set}
}
