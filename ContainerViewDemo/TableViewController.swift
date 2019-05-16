//
//  TableViewController.swift
//  ContainerViewDemo
//
//  Created by Kevin Yu on 10/11/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

final class TableViewController: UIViewController, TableContainerProtocol {

    let CELL_IDENTIFIER = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: ContainerVCProtocol!
    
    // this should be some model
    let datums = ["smrtDog.jpeg", "darlingCat.jpg", "hamFluff.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: CELL_IDENTIFIER)
    }
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // communicate designated change
        delegate.didSelectContainerOption(datums[indexPath.row])
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath)
        cell.textLabel?.text = datums[indexPath.row]
        return cell
    }
}
