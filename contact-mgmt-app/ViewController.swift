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
    var contacts : [Contact] = []
    var selectedContact : Contact?
    var requestCount=60
    
    var searchedContacts : [Contact] = []
    var searching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        getContent(reqCount : requestCount)
     }
    
    //for api call
    func getContent(reqCount : Int){
        let url = URL(string:"https://randomuser.me/api/?results="+String(reqCount))
         let task = URLSession.shared.dataTask(with: url!) {
            (data,response,error) in
            guard let jsonResponse = (try?  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
                print("Not containing JSON")
                return
            }
            print(jsonResponse)

        //Actual Parsing of data
            do {
                if var data = data,
                     var results = jsonResponse["results"] as? [[String: Any]] {
                   
                    var title : String!
                    var firstName : String!
                    var lastName : String!
                    var streetName : String!
                    var cityName : String!
                    var phoneNumber : String!
                    var cellNumber : String!
                    var emailAddress : String!
                    var profilePicture : String!
                    var largeProfilePicture : String!
                    
                    for result in results {
                        if var name = result["name"] as? [String: Any]{
                            title=name["title"] as? String ?? ""
                            firstName=name["first"] as? String ?? ""
                            lastName=name["last"] as? String  ?? ""
                         }
                       emailAddress = result["email"] as? String ?? ""
                        phoneNumber = result["phone"] as? String ?? ""
                        cellNumber = result["cell"] as? String ?? ""
 
                        if var location = result["location"] as? [String: Any]{
                            streetName = location["street"] as? String ?? ""
                            cityName=location["city"] as? String ?? ""
                        }

                        if var picture = result["picture"] as? [String: Any]{
                            profilePicture = picture["thumbnail"] as? String ?? ""
                            largeProfilePicture=picture["large"] as? String ?? ""
                        }
                        
                        let newContact = Contact.init(title: title!, fname: firstName!, lname: lastName, street: streetName, city: cityName, email: emailAddress!, phone: phoneNumber, cell: cellNumber, profilePicture: profilePicture!,largePic: largeProfilePicture)
                        self.contacts.append(newContact)
                    }
 
                 }
            } catch {
                print("Error deserializing JSON: \(error)")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
        task.resume()
    }
    //Table View Row Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contacts.count
    }
    
    //Preparation of Cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact_cell", for:indexPath) as! ContactCellViewController
       
        let contact : Contact
       contact=contacts[indexPath.row]
        cell.contactName?.text =
               contact.title +
                " " + contact.fname +
                " " + contact.lname
        cell.labelEmailAddress?.text=contact.email
        
        //Image loading
        let url = URL(string: contact.profilePicture)
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
        selectedContact = contacts[indexPath.row]
        performSegue(withIdentifier: "detail_segue", sender: self)
    }
    
    //function for defining seuge- navigating to new view , Detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="detail_segue"{
            let detailViewController=segue.destination as? DetailViewController
            detailViewController?.contact = selectedContact!
        }
    }

//    //Searchbar
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty || searchText.count < 3 {
//                searchedContacts = contacts
//                tableView.reloadData()
//                return
//        }
//
//        searchedContacts = contacts.filter({contact -> Bool in
//            (contact.title+""+contact.fname).contains(searchText)
//        })
//        tableView.reloadData()
//    }
//
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//
//    }
//
//
 
}

