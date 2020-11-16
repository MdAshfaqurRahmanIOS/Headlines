//
//  ViewController.swift
//  Headlines
//
//  Created by Md Ashfaqur Rahman on 16/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func searchButton(_ sender: UIButton) {
        
    }
}

extension ViewController: UITextFieldDelegate {
//    Learn this methood tomorrow
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        <#code#>
//    }
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        <#code#>
//    }
}

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 174
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    
//}
