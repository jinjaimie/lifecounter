//
//  PlayerControlView.swift
//  lifecounter2
//
//  Created by Jaimie Jin on 4/27/21.
//

import UIKit

class PlayerControlView: UIView {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var delegate: playerDelegate?
    var score = 20
    var subValue = 5
    var addValue = 5
    let nibName = "PlayerControlView"
        var contentView: UIView?
    var players = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6", "Player 7", "Player 8"]
    @IBOutlet weak var play: UIButton!
    @IBOutlet var label: UILabel!
    var data : (Int) = (-1) {
        didSet {
            // Update the label with modified data
            play.setTitle(players[data], for: .normal)
        }
    }

    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initSubViews()
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        initSubViews()
        }
    
    private func initSubViews() {
        // Instantiate the nib into existence
        let nib = UINib(nibName: nibName, bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        
        // Get the view from the instantiated nib and add it into our own tree
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
        
        // Wire up the controls to this view
    }
    
    func reset() {
        score = 20
        label.text = "20"
    }
    
    @IBAction func Add1(_ sender: UIButton) {
        delegate!.hideMessage()
        score += 1
        label.text = String(score)
        delegate!.addHistory(player: play.currentTitle!, action: "+", num: 1)
        delegate!.gameStart()
    }
    @IBAction func Add5(_ sender: UIButton) {
        delegate!.hideMessage()
        score += addValue
        label.text = String(score)
        delegate!.addHistory(player: play.currentTitle!, action: "+", num: addValue)
        delegate!.gameStart()
    }
    @IBAction func Sub1(_ sender: UIButton) {
        delegate!.hideMessage()
        score -= 1
        label.text = String(score)
        delegate!.addHistory(player: play.currentTitle!, action: "-", num: 1)
        delegate!.checkScore(score: score, player: self.play.currentTitle!)
        delegate!.gameStart()
    }
    @IBAction func Sub5(_ sender: UIButton) {
        delegate!.hideMessage()
        score -= subValue
        label.text = String(score)
        delegate!.addHistory(player: play.currentTitle!, action: "-", num: subValue)
        delegate!.checkScore(score: score, player: self.play.currentTitle!)
        delegate!.gameStart()
    }
    
    @IBAction func changeName(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Enter new name?", message: "Enter your name", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            let name = alertController.textFields?[0].text
            sender.setTitle(name, for: .normal)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = sender.currentTitle
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        delegate!.present(alertController: alertController)
        
    }
    
    @IBOutlet var minusButton: UIButton!
    @IBAction func changeMinusVal(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Enter new value?", message: "Enter how many lives to subtract by", preferredStyle: .alert)
        alertController.addTextField { (textField) -> Void in
            textField.keyboardType = UIKeyboardType.numberPad
            textField.placeholder = self.minusButton.currentTitle
        }
        
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            let name = alertController.textFields?[0].text
            if (Int(name!) != nil) {
                self.minusButton.setTitle("-" + name!, for: .normal)
                self.subValue = Int(name!)!
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        delegate!.present(alertController: alertController)
    }
    @IBOutlet var addButton: UIButton!
    @IBAction func changeAddVal(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Enter new value?", message: "Enter how many lives to add by", preferredStyle: .alert)
        alertController.addTextField { (textField) -> Void in
            textField.keyboardType = UIKeyboardType.numberPad
            textField.placeholder = self.addButton.currentTitle
        }
        
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            let name = alertController.textFields?[0].text
            if (Int(name!) != nil) {
                self.addButton.setTitle("+" + name!, for: .normal)
                self.addValue = Int(name!)!
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        delegate!.present(alertController: alertController)
    }

}
