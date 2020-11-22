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
    
    var detailsImageCont = ""
    var detailsHeadLineCont = ""
    var detailsAuthorNameCont = ""
    var detailsDateCont = ""
    var detailsNewsBodyCotn = ""
    var detailsWeburlCont = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if detailsImageCont != "" {
            if let imageURL = URL(string: detailsImageCont) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.detailsImageView.image = image
                        }
                    }
                }
            }
        }
        
        detailsHeadLineLabel.text = detailsHeadLineCont
        detailsAuthorNameLabel.text = detailsAuthorNameCont
        detailsDateLabel.text = detailsDateCont
        detailsNewsBodyLabel.text = detailsNewsBodyCotn
    }
    
    @IBAction func detailsShowMoreButton(_ sender: UIButton) {
        let webVC = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        webVC.weburl = detailsWeburlCont
        
        navigationController?.pushViewController(webVC, animated: true)
        
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
