//
//  GamesTableViewController.swift
//  TicTacToe
//
//  Created by Kenny Batista on 11/15/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GamesTableViewController: UITableViewController {

    let boards: Variable<[Board]> = Variable([])
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        //   boards.asObservable().bindTo(tableView.rx.items(cellIdentifier: String, cellType: UITableViewCell.self)){
//        (row: Int, board: Board, cell: UITableViewCell) in
//        
//    }
    
        boards.asObservable().bindTo(tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){
            index,board,cell in
            if let winner = board.winner(){
                cell.textLabel?.text = "Winner \(winner.rawValue)"
            } else {
                cell.textLabel?.text = "Current turn: \(board.playerWithCurrentTurn())"
            }
            
        }.addDisposableTo(disposeBag)

    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ViewController {
            destinationViewController.addBoard = { (board: Board) in
            self.boards.value.append(board) // or $0, but remove what we take in : (board: Board)
        }
    }

    }
}




