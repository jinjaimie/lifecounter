//
//  ViewControllerHistory.swift
//  Life Counter
//
//  Created by Jaimie Jin on 4/26/21.
//

import UIKit

class ViewControllerHistory: UIViewController {
    var history:[String] = [];
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = history[0]
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        self.dismiss(animated: false)
        
    }
}

