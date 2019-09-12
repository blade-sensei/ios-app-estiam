//
//  ViewController.swift
//  MonApp
//
//  Created by work on 11/09/2019.
//  Copyright © 2019 work. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBAction func login(_ sender: Any) {
        
        let username = textFieldUsername.text
        let password = textFieldPassword.text
        
        let parametersRequestLogin = ["username": username, "password": password]
        
        let projectsURL = URL(string: "http://localhost:3000/api/auth/login")!
        var request = URLRequest(url: projectsURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parametersRequestLogin, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let auth:Auth?
                let decode = JSONDecoder()
                let authResponse = try decode.decode(Auth.self, from: data)
                print(authResponse.token)
                UserDefaults.standard.set(authResponse.token, forKey: "userToken" )
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
}

