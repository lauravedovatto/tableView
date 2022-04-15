//
//  ViewController.swift
//  TableViewTests
//
//  Created by Felipe Melo on 15/04/22.
//  Copyright © 2022 Felipe Melo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let nomes = [
        "Minatti",
        "Thay",
        "Laura"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as? NameTableViewCell
        cell?.nameLabel?.text = nomes[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
}
