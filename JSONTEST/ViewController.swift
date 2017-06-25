//
//  ViewController.swift
//  JSONTEST
//
//  Created by Eashan Ashrafulzaman on 6/20/17.
//  Copyright © 2017 Eashan Ashrafulzaman. All rights reserved.
// Git is aweosme ..

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button(_ sender: Any) {
        
        JSONDATA()
    }
    func JSONDATA() {
        
        //let itunes = "http://api.openweathermap.org/data/2.5/weather?zip=1208,bd&appid=68b96c5bd059b8afa4de1fb5392da0b5"
        
        let itunes = "http://api.openweathermap.org/data/2.5/weather?q=\(textField.text!)&appid=68b96c5bd059b8afa4de1fb5392da0b5"
        let url = URL(string: itunes)!
        let session = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                print("Error Retrieving data: \(error.localizedDescription)")
            } else {
                
                //print(data!)
                guard let data = data else {
                    print("data was nil?")
                    return
                }
                
                let json = try!JSON(data: data)
                print(json)
                let tempareture = json["main"]["temp"].stringValue
                print(tempareture)
                let city = json["name"].stringValue
                print(city)
                let description = json["weather"][0]["main"].stringValue
                print(description)
                let country = json["sys"]["country"].stringValue
                print(country)
                let details = json["weather"][0]["description"].stringValue
                print(details)
                
                /*
                 // ANOTHER WEATHER URL
                 // "https://api.apixu.com/v1/current.json?key=911127c06e194ac6a7e112328172006&q=Dhaka"
                 
                 let city = json["location"]["name"].stringValue
                 print(city)
                 let country = json["location"]["country"].stringValue
                 print(country)
                 let detaisInfo = json["current"]["condition"]["text"].stringValue
                 print(detaisInfo)
                 let temp = json["current"]["temp_c"].stringValue
                 print(temp)
                 let image = json["current"]["condition"]["icon"].stringValue
                 print(image)
                 */
            }
            
        }
        
        session.resume()
    }


}

