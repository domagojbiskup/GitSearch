//
//  GitResultsTVC.swift
//  GitSearch
//
//  Created by Domagoj Biškup on 10/06/2021.
//

import UIKit

class GitResultsTVC: UITableViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let format = Format()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        self.fetchData()
        self.tableView.reloadData()
        activityIndicator.stopAnimating()
    }
    
    @IBAction func pullToRefresh(_ sender: UIRefreshControl) {
        activityIndicator.startAnimating()
        self.fetchData()
        self.tableView.reloadData()
        activityIndicator.stopAnimating()
        sender.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitRepo?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = gitRepo?.items[indexPath.row].name
        cell.detailTextLabel?.text = format.date((gitRepo?.items[indexPath.row].updatedAt)!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        arrayIndex = indexPath.row
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    @IBAction func closeDetailVC(segue: UIStoryboardSegue) {}
}
