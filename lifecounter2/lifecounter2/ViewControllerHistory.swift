//
//  ViewControllerHistory.swift
//  lifecounter2
//
//  Created by Jaimie Jin on 4/28/21.
//
import UIKit

class ViewControllerHistory: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var history:[String] = [];
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = self.history[indexPath.row]

        return cell
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        self.dismiss(animated: false)
        
    }

}
