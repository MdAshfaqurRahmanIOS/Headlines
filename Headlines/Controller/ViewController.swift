//
//  ViewController.swift
//  Headlines
//
//  Created by Md Ashfaqur Rahman on 16/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var newsTableView: UITableView!
    
    var jsonManager = JSONManager()
    var articlesArray = [Articles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        jsonManager.delegate = self
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
//        view.addGestureRecognizer(tap)
//        newsTableView.addGestureRecognizer(tap)
        
        jsonManager.watherFunc(city: "us")
    }
    
//    @objc func DismissKeyboard(){
//        //Causes the view to resign from the status of first responder.
//        view.endEditing(true)
//    }


    @IBAction func searchButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Click me 1")
        searchTextField.borderStyle = .bezel
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Click me 2")
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Click me 3")
        if searchTextField.text != "" {
            searchTextField.placeholder = ""
            jsonManager.watherFunc(city: searchTextField.text!)
            return true
        } else {
            searchTextField.placeholder = "Type Country Short Name"
            return true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Click me 4")
        textField.text = ""
        searchTextField.borderStyle = .roundedRect
    }
}




extension ViewController: WeatherProtocol {
    func showCuntryName(jsonModel: JSONModel) {
        DispatchQueue.main.async {
//            self.countryName.text = String(temp.tempShow)
//            self.descriptionLabel.text = temp.fulldescription
//            print("chekc data\(temp.articles[0].title ?? "")")
            self.articlesArray = jsonModel.articles
            self.newsTableView.reloadData()

        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        cell.cellHeadlineLabel.text = articlesArray[indexPath.row].title
        cell.cellAuthorLabel.text = articlesArray[indexPath.row].author
        cell.celNewsProviderNameLabel.text = articlesArray[indexPath.row].source.name
        
        if articlesArray[indexPath.row].urlToImage != nil {
            if let imageURL = URL(string: articlesArray[indexPath.row].urlToImage!) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.cellImageView.image = image
                        }
                    }
                }
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        detailsVC.detailsImageCont = articlesArray[indexPath.row].urlToImage ?? ""
        detailsVC.detailsHeadLineCont = articlesArray[indexPath.row].title ?? ""
        detailsVC.detailsAuthorNameCont = articlesArray[indexPath.row].author ?? ""
        detailsVC.detailsDateCont = articlesArray[indexPath.row].publishedAt ?? ""
        detailsVC.detailsNewsBodyCotn = articlesArray[indexPath.row].content ?? ""
        detailsVC.detailsWeburlCont = articlesArray[indexPath.row].url ?? ""
        
        
        
        navigationController?.pushViewController(detailsVC, animated: true)
        
        
    }
    
}
