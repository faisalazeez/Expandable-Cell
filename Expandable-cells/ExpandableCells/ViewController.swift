//
//  ViewController.swift
//  ExpandableCells
//
//  Created by Faisal Azeez on 17.01.2019.
//  Copyright © 2019 Faisal Azeez. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet fileprivate weak var tableView: UITableView!
    fileprivate var dataSource = DataSource()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200.0
        tableView.separatorStyle = .none
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ScheduleCell
        
        cell.state = .expanded
        dataSource.addExpandedIndexPath(indexPath)

        DispatchQueue.main.async {
            tableView.beginUpdates()
            UIView.animate(withDuration: 0.7) {
                cell.detailView.alpha = 1
            }
            tableView.endUpdates()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ScheduleCell
     
        cell.state = .collapsed
        dataSource.removeExpandedIndexPath(indexPath)
        
        DispatchQueue.main.async {
            tableView.beginUpdates()
            UIView.animate(withDuration: 0.7) {
                cell.detailView.alpha = 0
            }
            tableView.endUpdates()
        }
    }
}

