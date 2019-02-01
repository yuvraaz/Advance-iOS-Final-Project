//
//  ViewController.swift
//  contact-mgmt-app
//
//  Created by Youbaraj Poudel on 1/20/19.
//  Copyright © 2019 Youbaraj Poudel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
   
     @IBOutlet weak var tableView: UITableView!
    var contactResults : [Result] = []
    var selectedContactResult : Result?
    var requestCount=70
    
     var searching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        getContent(reqCount : requestCount)
     }
    
    //for api call
    func getContent(reqCount : Int){
         let url = URL(string:"https://randomuser.me/api/?results="+String(reqCount)+"&seed=Youbaraj")
        
        
         let task = URLSession.shared.dataTask(with: url!) {
            (data,response,error) in
            //getting all json response
            guard let data = data else{
                print("Sorry !!! , Response data not available")
                return
            }
            
            do{
                //Actuall decoding carried out here.
                let response = try JSONDecoder().decode(ContactResponse.self, from: data)
                //Looping into json array/ contact array
                for res in response.results!{
                    self.contactResults.append(res)
                }
                
                DispatchQueue.main.async{
                        self.tableView.reloadData()
                }
            }
            catch let jsonErr
            {
                print("Error deserializing JSON: \(error)")
            }
            
            }.resume()

    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contactResults.count
    }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact_cell", for:indexPath) as! ContactCellViewController
       
        var contactRes : Result
       contactRes=contactResults[indexPath.row]
        cell.contactName?.text =
            ""+(contactRes.name?.title)! +
            "." + (contactRes.name?.first)! +
            " " + (contactRes.name?.last)!
        cell.labelEmailAddress?.text=contactRes.email
        
        //Image loading
        let url = URL(string: (contactRes.picture?.thumbnail)!)
        let data = try? Data(contentsOf: url!)
        cell.contactImage.image = UIImage(data: data!)
        
        //set background dynamically to cell
        cell.cellBackgroundView.backgroundColor = UIColor(rgb: 0xf39c12)
        if (indexPath.row % 2) != 0{
            cell.cellBackgroundView.alpha=0.1
        }else{
            cell.cellBackgroundView.alpha=0.4
        }
        
        return cell
    }
    
    //define when i touch or select item on the list
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContactResult = contactResults[indexPath.row]
        performSegue(withIdentifier: "detail_segue", sender: self)
    }
    
    //function for defining seuge- navigating to new view , Detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="detail_segue"{
            let detailViewController=segue.destination as? DetailViewController
            detailViewController?.contact = selectedContactResult
        }
    }
 
 
}

