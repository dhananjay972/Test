//
//  ViewController.swift
//  Test
//
//  Created by Apple on 18/07/20.
//  Copyright © 2020 V group Inc. All rights reserved.
//

import UIKit
import SwiftChart

class LeaderBoardViewController: UIViewController {
    
    @IBOutlet weak var leaderBoardTableView: UITableView!
    @IBOutlet weak var sortViewCorve: UIView!
    @IBOutlet weak var sortView: UIView!
    @IBOutlet weak var sortTableView: UITableView!
    @IBOutlet weak var wholeView: UIView!
    var sortByArray: [[String:Any]]!
    var isBool = true
    var checkSelectValue : Int!
    var checkSelectedImage: String!
    var oldIndex : IndexPath!
    var temp = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        sortView.isHidden = true
        wholeView.isHidden = true
        sortViewCorve.cornerView()
        sortByArray = [["image":"Dollar.png","name":"TOTAL SALES"],["image":"cart.png","name":"ADD TO CART"],["image":"Download.png","name":"DOWNLOADS"],["image":"name.png","name":"USER SESSIONS"]]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LeaderBoardViewController.dismissBlurView(_:)))
        wholeView.addGestureRecognizer(tap)
        wholeView.isUserInteractionEnabled = true
    }
    
    @objc func dismissBlurView(_ sender: UITapGestureRecognizer) {
        leaderBoardTableView.isUserInteractionEnabled = true
        sortView.animationView(isHidden:true)
        wholeView.animationView(isHidden:true)
        isBool = true
        temp = 1
        leaderBoardTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        sortView.roundCorners(cornerRadius: 20.0)
    }
    
    
}
//Action
extension LeaderBoardViewController{
    @IBAction func sortBy(_ sender:Any)
    {
        leaderBoardTableView.isUserInteractionEnabled = false
        sortView.animationView(isHidden:false)
        wholeView.animationView(isHidden:false)
        isBool = false
        sortTableView.reloadData()
        
    }
    
    
}

//TableViewDelegate
extension LeaderBoardViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isBool == false{
            return sortByArray.count
        }
        return 5
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isBool == false{
            
            let cell = sortTableView.dequeueReusableCell(withIdentifier: "SortByTableViewCell") as! SortByTableViewCell
            let data = sortByArray[indexPath.row]
            if indexPath.row == checkSelectValue {
                cell.titleImage.image = UIImage(named:checkSelectedImage)
            }
            else{
                cell.titleImage.image = UIImage(named: data["image"] as! String)
            }
            cell.titleLabel.text! = data["name"] as! String
            
            return cell
            
        }
        let cell = leaderBoardTableView.dequeueReusableCell(withIdentifier: "TableViewTableViewCell") as! LeaderBoardTableViewCell
        if checkSelectValue == 0
        {
            cell.dollarBtn.setImage(UIImage(named: checkSelectedImage), for: .normal)
            cell.cartBtn.setImage(UIImage(named: "cart.png"), for: .normal)
            cell.downloadBtn.setImage(UIImage(named: "Download.png"), for: .normal)
            cell.userBtn.setImage(UIImage(named: "name.png"), for: .normal)
        }
        if checkSelectValue == 1
        {
            cell.dollarBtn.setImage(UIImage(named: "Dollar.png"), for: .normal)
            cell.cartBtn.setImage(UIImage(named: checkSelectedImage), for: .normal)
            cell.downloadBtn.setImage(UIImage(named: "Download.png"), for: .normal)
            cell.userBtn.setImage(UIImage(named: "name.png"), for: .normal)
        }
        if checkSelectValue == 2
        {
            cell.dollarBtn.setImage(UIImage(named: "Dollar.png"), for: .normal)
            cell.cartBtn.setImage(UIImage(named: "cart.png"), for: .normal)
            cell.downloadBtn.setImage(UIImage(named: checkSelectedImage), for: .normal)
            cell.userBtn.setImage(UIImage(named: "name.png"), for: .normal)
        }
        if checkSelectValue == 3
        {
            cell.dollarBtn.setImage(UIImage(named: "Dollar.png"), for: .normal)
            cell.cartBtn.setImage(UIImage(named: "cart.png"), for: .normal)
            cell.downloadBtn.setImage(UIImage(named: "Download.png"), for: .normal)
            cell.userBtn.setImage(UIImage(named: checkSelectedImage), for: .normal)
        }
        let data = [
            (x: 0, y: 0),
            (x: 3, y: 2.5),
            (x: 4, y: 2),
            (x: 5, y: 2.3)
        ]
        let series = ChartSeries(data: data)
        series.area = true
        
        // Use `xLabels` to add more labels, even if empty
        cell.chartView.xLabels = [0, 3, 6, 9]
        
        // Format the labels with a unit
        cell.chartView.xLabelsFormatter = { String(Int(round($1))) + "h" }
        
        cell.chartView.add(series)
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sortTableView
        {
            
            if let cell = sortTableView.cellForRow(at: indexPath) {
                let image = ["colorDollar.png","colorCart.png","colorDownload.png","colorName.png"]
                let cells = sortTableView.cellForRow(at: indexPath) as! SortByTableViewCell
                checkSelectValue = indexPath.row
                oldIndex = indexPath
                cells.titleImage.image = UIImage(named: image[indexPath.row])
                checkSelectedImage = image[indexPath.row]
                if temp == 1{
                    resetChecks(index:oldIndex)
                    sortTableView.reloadData()
                }
                cell.accessoryType = .checkmark
                
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        sortTableView.reloadData()
        if tableView == sortTableView
        {
            resetChecks(index:oldIndex)
        }
    }
    func resetChecks(index:IndexPath) {
        for i in 0..<sortTableView.numberOfSections {
            for j in 0..<sortTableView.numberOfRows(inSection: i) {
                
                if let cells = sortTableView.cellForRow(at: IndexPath(row: j, section: i)){
                    let imageUnSelect = ["Dollar.png","cart.png","Download.png","name.png"]
                    let cell = sortTableView.cellForRow(at: index) as! SortByTableViewCell
                    cells.accessoryType = .none
                    cell.titleImage.image = UIImage(named: imageUnSelect[index.row])
                    
                }
                
                
            }
            
        }
    }
}

