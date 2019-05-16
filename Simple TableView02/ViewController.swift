//
//  ViewController.swift
//  Simple TableView02
//
//  Created by D7703_23 on 2019. 5. 2..
//  Copyright © 2019년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var myTableView: UITableView!
    var animals = ["Cat","Dog","Bird","Pig","Horse","Whale"]
    var year = ["고양이","개","새","돼지","말","고래"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self
        
        //navigationBar
        self.title = "동물농장"
    }
    
    // UITableViewDataSource Method
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return animals.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if section == 0 {
            return "Animal Farm 1"
        }else{
            return "Animal Farm 2"
        }
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        if section == 0 {
            return "End of Animal Farm 1"
        }else{
            return "End of Animal Farm 2 "
        }
    }
    
    
    // cell을 생성
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        // cell 생성, 재활용 풀 사용
        let cell = myTableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath)
        let row = indexPath.row
        print("section: \(indexPath.section)    row:\(indexPath.row)")
    
        cell.textLabel?.text = animals[row]
        cell.detailTextLabel?.text = year[row]
        
        //image넣기
        cell.imageView?.image = UIImage(named: animals[row])
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addgo"  {
            let AVC = segue.destination as! AddViewController
            AVC.myData = animals[0]
            AVC.myImage = animals[0]
            AVC.myTitle = year[0]
    }
        else if segue.identifier == "go"{
        let DVC = segue.destination as! DetailViewController
            let Row = myTableView.indexPathForSelectedRow
            DVC.Detail = animals[(Row?.row)!]
            DVC.Img = animals[(Row?.row)!]
        
}
}
}
