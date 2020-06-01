//
//  WinnersTableViewController.swift
//  Campões das Copas do Mundo
//
//  Created by William Tomaz on 27/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class WinnersTableViewController: UITableViewController {
    
    var worldCups: [WorldCup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //loadWorldCups()
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int { //informa quantas sessões a tableview irá ter
//
//        return 1 // retornando "1" não precisa implementar esse metodo
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //retorna o valor de linhas a cada sessão
        return worldCups.count // retorna a quntidade de elementos do array
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //sempre que a celula for ser prepara dispara esse metodo
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorldCupTableViewCell //aqui ele pega a celular criada // está tratando a celula como a classe criada
        let worldCup = worldCups[indexPath.row] //está pegando as linhas do array
//        lbDate.text = "\(worldCup.year)" //está pegando o indice especifico do array criado na struct
        cell.prepare(with: worldCup)
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WorldCupViewController // define qual a tela que será chamada
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row ]//tras o indice selecionado na tabela do array worldCups
        vc.worldCup = worldCup // passa o array para a outra view controller
    }
    
    func loadWorldCups() {
        let fileURL = Bundle.main.url(forResource: "winners", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData) //decodifica o jsondata e transforma em um array de WorldCup
        } catch {
            debugPrint(error)
        }
    }
}
