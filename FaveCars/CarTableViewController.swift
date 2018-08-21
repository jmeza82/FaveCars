//
//  CarTableViewController.swift
//  FaveCars
//
//  Created by Juan Meza on 12/26/17.
//  Copyright © 2017 Tech-IN. All rights reserved.
//

import UIKit

var namesArray = [String]()
var imagesArray = [UIImage]()

class CarTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return namesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarTableViewCell

        //let carImgView = cell.viewWithTag(10) as! UIImageView
        cell.carImgView.image = imagesArray[indexPath.row]
        /*cell.carImgView.layer.cornerRadius = 10
        cell.carImgView.clipsToBounds = true*/
        
        /*let backLabel = cell.viewWithTag(11) as! UILabel
        backLabel.layer.cornerRadius = 10
        backLabel.layer.borderColor = UIColor.darkGray.cgColor
        backLabel.layer.borderWidth = 3.0
        backLabel.clipsToBounds = true*/
        
        /*let numberLabel = cell.viewWithTag(12) as! UILabel
        numberLabel.layer.cornerRadius = 17.5
        numberLabel.layer.borderColor = UIColor.black.cgColor
        numberLabel.layer.borderWidth = 3
        numberLabel.clipsToBounds = true*/
        cell.numberLabel.text = "\(indexPath.row + 1)"
        
        ///let titleLabel = cell.viewWithTag(13) as! UILabel
        /*titleLabel.layer.cornerRadius = 10
        titleLabel.layer.borderColor = UIColor.darkGray.cgColor
        titleLabel.layer.borderWidth = 3
        titleLabel.clipsToBounds = true*/
        cell.titleLabel.text = namesArray[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }
    
    
    @IBAction func load(_ sender: Any) {
        
        namesArray = ["AUDI", "BMW", "LUXER", "MERCEDES"]
        imagesArray = [UIImage(named:"car1")!, UIImage(named:"car2")!, UIImage(named:"car3")!, UIImage(named:"car4")!]
        
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            namesArray.remove(at: indexPath.row)
            imagesArray.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.reloadData()
        
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

  

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
