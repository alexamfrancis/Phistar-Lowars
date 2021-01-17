//
//  DetailInfoTableViewController.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/17/21.
//

import UIKit

class MoreInfoTableViewController: UITableViewController {
    
    var detailObject: Detailable?
    var detailData = [Constants.SWCategory: [Detailable]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.detailData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = self.detailData.index(self.detailData.startIndex, offsetBy: section)
        return self.detailData[index].value.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let index = self.detailData.index(self.detailData.startIndex, offsetBy: indexPath.section)
        cell.textLabel?.text = self.detailData[index].value[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let index = self.detailData.index(self.detailData.startIndex, offsetBy: section)
        let key = self.detailData.keys[index]
        return key.rawValue.capitalized
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailable = self.detailData[index].value[indexPath.row]
        let detailVC = MoreInfoTableViewController()
        detailVC.detailObject = detailable
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
