//
//  WorldCupViewController.swift
//  Campões das Copas do Mundo
//
//  Created by William Tomaz on 27/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {

    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var worldCup: WorldCup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }

    func prepareView(){
        title = "WorldCup \(worldCup.year)"
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        lbScore.text = "\(worldCup.winnerScore) - \(worldCup.viceScore)"
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
    }
    
}

extension WorldCupViewController: UITableViewDataSource { // possui metodos obrigatorios
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return worldCup.matches.count //numero de partidas é a quantidade de sessões
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games  //devolve a fase do indice na sessão e recupera os jogos da fase
        return games.count //total de linhas é o total de jogos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell//pega o index do parametro //transforma a celula em uma GamesTableViewCell
        
        let match = worldCup.matches[indexPath.section] //recuperando a sessão e passando o indice
        let game = match.games[indexPath.row]
        cell.prepare(with: game)
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { //titulo do cabeçalho da sessão
        let match = worldCup.matches[section] //pegando o indice da sessão do array
        return match.stage // retornando o texto do array "stage"
    }
}

extension WorldCupViewController: UITableViewDelegate { //nao possui metodo obrigatorio
    
}
