//
//  ViewController.swift
//  Heroes-iOS
//
//  Created by Mañanas on 24/6/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    var superheroList: [Superhero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingView.setCornerRadius(16)
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        
        searchSuperheroesByName(query: "a")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperheroCell", for: indexPath) as! SuperheroViewCell
        let superhero = superheroList[indexPath.row]
        cell.render(with: superhero)
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSuperheroesByName(query: searchBar.text!)
    }
    
    func searchSuperheroesByName(query: String) {
        loadingView.isHidden = false
        Task {
            superheroList = await SuperheroProvider.findSuperheroesByName(query: query)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.loadingView.isHidden = true
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        detailViewController.superhero = superheroList[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

