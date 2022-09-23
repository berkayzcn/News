//
//  ViewController.swift
//  News
//
//  Created by Berkay Ozcan on 11/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewModel : newsTableVM!
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        veriAl()
    }

    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        
        webService().newsDown(url: url!) { haberler in
            if let haberler = haberler {
                self.newsTableViewModel = newsTableVM(newlist: haberler)
                print("aldi")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.forRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        let newsviewmodel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        cell.titleLabel.text = newsviewmodel.title
        cell.storyLabel.text = newsviewmodel.story
        return cell
    }
    

}

