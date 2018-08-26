//
//  ViewController.swift
//  SortAlgorithms
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 21/08/2018.
//  Copyright © 2018 Djorkaeff Alexandre Vilela Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "CellIdentifier"
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    var numbers = [Int]()
    
    var algorithms = Algorithms()
    
    var increment : Int! = 1000
    var auxIncrement : Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        navBar.topItem?.title = "Vector.count = " + String(numbers.count)
    }
    
    func fetchData() {
        for _ in 0..<1000 {
            let ran:Int = Int(arc4random_uniform(10000))
            numbers.append(ran)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addNumbers(_ sender: Any) {
        if auxIncrement==9 {
            return
        }
        for _ in 0..<increment {
            let ran:Int = Int(arc4random_uniform(10000))
            numbers.append(ran)
        }
        auxIncrement += 1
        navBar.topItem?.title = "Vector.count = " + String(numbers.count)
        table.reloadData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var numbersSort = [Int]()
        if segue.identifier == "insertion" {
            guard let viewController = segue.destination as? SortViewController else { return }
            
            let startTime = CFAbsoluteTimeGetCurrent()
            numbersSort = algorithms.insertionSort(numbers)
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            
            viewController.lblTime = String(timeElapsed) + "(s)"
            viewController.numbers = numbersSort
            viewController.lblSort = segue.identifier!
        } else if segue.identifier == "selection" {
            guard let viewController = segue.destination as? SortViewController else { return }
            
            let startTime = CFAbsoluteTimeGetCurrent()
            numbersSort = algorithms.selectionSort(numbers)
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            
            viewController.lblTime = String(timeElapsed) + "(s)"
            viewController.numbers = numbersSort
            viewController.lblSort = segue.identifier!
        } else if segue.identifier == "bubble" {
            guard let viewController = segue.destination as? SortViewController else { return }
            
            let startTime = CFAbsoluteTimeGetCurrent()
            numbersSort = algorithms.bubbleSort(numbers)
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            
            viewController.lblTime = String(timeElapsed) + "(s)"
            viewController.numbers = numbersSort
            viewController.lblSort = segue.identifier!
        }
    }
}
