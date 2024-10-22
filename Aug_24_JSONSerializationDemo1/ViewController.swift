//
//  ViewController.swift
//  Aug_24_JSONSerializationDemo1
//
//  Created by Vishal Jagtap on 22/10/24.
//

import UIKit

class ViewController: UIViewController {

    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
    }
    
    func jsonParsing(){
        url = URL(string: Constant.urlString)
        
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        
        urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession?.dataTask(with: urlRequest!, completionHandler: { data, response, error in
            
            print(data)
            print(response)
            print(error)
            
            let jsonResponseOfApi = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
            
            for eachUser in jsonResponseOfApi{
                let eachUserId = eachUser["id"] as! Int
                let eachUserName = eachUser["name"] as! String
                let eachUserCompany = eachUser["company"] as! String
                let eachUserUserName = eachUser["username"] as! String
                let eachUserEmail = eachUser["email"] as! String
                let eachUserAddress = eachUser["address"] as! String
                let eachUserZip = eachUser["zip"] as! String
                let eachUserState = eachUser["state"] as! String
                let eachUserCountry = eachUser["country"] as! String
                let eachUserPhone = eachUser["phone"] as! String
                let eachUserPhoto = eachUser["photo"] as! String
                
                let newSwiftUserObject = User(id: eachUserId, name: eachUserName,
                                              company: eachUserCompany, username: eachUserName,
                                              email: eachUserEmail, address: eachUserAddress,
                                              zip: eachUserZip, state: eachUserState,
                                              country: eachUserCountry,
                                              phone: eachUserPhone, photo: eachUserPhoto)
                
                self.users.append(newSwiftUserObject)
                print("Array of Swift Objects -- \(self.users)")
            }
        })
        dataTask?.resume()
    }
}
