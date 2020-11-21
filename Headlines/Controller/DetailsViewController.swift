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
    @IBOutlet weak var detailsNewsBodyLabel: UITextView!
    
    var detailsImageCont = UIImage()
    var detailsHeadLineCont = ""
    var detailsAuthorNameCont = ""
    var detailsDateCont = ""
    var detailsNewsBodyCotn = ""
    var detailsWeburlCont = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsImageView.image = detailsImageCont
        detailsHeadLineLabel.text = detailsHeadLineCont
        detailsAuthorNameLabel.text = detailsAuthorNameCont
        detailsDateLabel.text = detailsDateCont
        detailsNewsBodyLabel.text = detailsNewsBodyCotn
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
