//
//  ViewController.swift
//  ThreeLetterWord
//
//  Created by Connor Reed on 11/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var wordLabels: [UILabel]!
    @IBOutlet weak var currentLetterLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    var letters:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var counter:Int = 0
    var currentLetter:String = "A"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCurrentLetter()
        // Do any additional setup after loading the view.
    }
    @IBAction func whenTapped(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: stackView)
        for label in self.wordLabels{
            if label.frame.contains(selectedPoint){
                label.text = self.currentLetter
            }
        }
        counter += 1
        if counter == 26{
            counter = resetCounter()
        }
        setCurrentLetter()
        
    }
    func setCurrentLetter(){
        self.currentLetter = self.letters[counter]
        self.currentLetterLabel.text = self.currentLetter
    }
    func resetCounter() -> Int{
        let alert = UIAlertController(title: "Reset Counter", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default){(action) in
            for label in self.wordLabels{
                label.text = "?"
            }
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        return 0;
    }

}

