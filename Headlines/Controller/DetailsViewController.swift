//
//  DetailsViewController.swift
//  Headlines
//
//  Created by Md Ashfaqur Rahman on 16/11/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsHeadLineLabel: UILabel!
    @IBOutlet weak var detailsAuthorNameLabel: UILabel!
    @IBOutlet weak var detailsDateLabel: UILabel!
    @IBOutlet weak var DetailsNewsBodyLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func detailsShowMoreButton(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
