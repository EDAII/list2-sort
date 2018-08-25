//
//  ViewController.swift
//  tableView
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 21/08/2018.
//  Copyright © 2018 Djorkaeff Alexandre Vilela Pereira. All rights reserved.
//

import UIKit

class SortViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "CellIdentifier"
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    var numbers = [Int]()
    var lblTime : String!
    var lblSort : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = lblTime
        navBar.topItem?.title = lblSort
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = String(numbers[indexPath.row])
        return cell
    }
}
