//
//  ViewController.swift
//  TableViewTests
//
//  Created by Felipe Melo on 15/04/22.
//  Copyright © 2022 Felipe Melo. All rights reserved.
//

import UIKit

class Empresa {
    var chefe: Funcionario?
    var funcionarios = [Funcionario]()
    
    func comecarAlmoco() {
        funcionarios.forEach({ $0.almocar() })
    }
    
    func contratarChefe(chefe: Funcionario) {
        self.chefe = chefe
        self.funcionarios.append(chefe)
    }
}

protocol Funcionario {
    func almocar()
    func trabalhar()
}

class TechLead: Funcionario {
    func almocar() {
        print("O chefe está almoçando...")
    }
    
    func trabalhar() {
        
    }
}

class Programador: Funcionario {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func almocar() {
        print(name + " está almoçando...")
    }
    
    func trabalhar() {
        
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let itau = Empresa()
        itau.contratarChefe(chefe: TechLead())
        itau.funcionarios.append(Programador(name: "Minatti"))

        itau.comecarAlmoco()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Minatti"
        
        return cell
    }
}
