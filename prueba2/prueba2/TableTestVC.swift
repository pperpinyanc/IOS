//
//  TableTestVC.swift
//  prueba2
//
//  Created by Pablo Perpinan on 23/2/24.
//

import Foundation
import UIKit


class TableTestVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    var numbersList: [Int] = []
    
    @IBOutlet weak var textTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTableView.dataSource = self
        textTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCelID", for: indexPath) as? TestCell else {
            return UITableViewCell()
        }
        
        cell.TextTitle.text = String(numbersList[indexPath.row])
        
        return cell
        
    }
    
    
    @IBAction func AddRowsBtPressed(_ sender: Any) {
        
        numbersList.append(numbersList.count + 1)
        
        textTableView.reloadData()
    }
    
    
}
