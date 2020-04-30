//
//  ViewController.swift
//  IOSDemoCoreData
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    fileprivate var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeViewModel()
        viewModel?.delegate = self
        viewModel?.loadData(sortStrategy: SortByName())
    }
    
    @IBAction func sortPressed(_ sender: UISegmentedControl) {
        
        var sortStrategy: SortStrategy
        
        if sender.selectedSegmentIndex == 0 {
            sortStrategy = SortByName()
        } else {
            sortStrategy = SortByDate()
        }
        
        viewModel?.sort(sortStrategy: sortStrategy)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? AddViewController {
            des.delegate = self
        }
    }
    
}

extension HomeViewController : AddViewControllerDelegate {
    
    func added() {
        
        var sortStrategy: SortStrategy
        
        if segment.selectedSegmentIndex == 0 {
            sortStrategy = SortByName()
        } else {
            sortStrategy = SortByDate()
        }
        
        viewModel?.loadData(sortStrategy: sortStrategy)
    }
}

extension HomeViewController : HomeViewModelDelegate {
    
    func reloadUI() {
        tableView.reloadData()
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.garments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = viewModel?.garments?[indexPath.row].name
        return cell;
    }
}


