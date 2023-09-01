//
//  ViewController.swift
//  MoviesApp
//
//  Created by Muhammad Hussain Baig on 30/08/2023.
//

import UIKit
import SDWebImage

protocol MoviesViewDelegate {
    func successfullyFetchData()
    func failToFetchData(error: String)
}

class MoviesView: UIViewController {

    var viewModel: MoviesViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = MoviesViewModel(delegate: self)
        
        self.viewModel?.fetchData()
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension MoviesView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getData().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return TableViewCell() }
        cell.setValues(result: (viewModel?.getDataAtIndex(index: indexPath.row))!)
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List Of Movies"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailView else {return}
        vc.setValues(result: (viewModel?.getDataAtIndex(index: indexPath.row))!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MoviesView: MoviesViewDelegate {
    func successfullyFetchData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func failToFetchData(error: String){
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
