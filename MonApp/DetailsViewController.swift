//
//  DetailsViewController.swift
//  MonApp
//
//  Created by work on 12/09/2019.
//  Copyright © 2019 work. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

   
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
    var project: Project? {
        didSet {
            self.title = self.project?.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel.text = self.project?.description
        self.statusLabel.text = self.project?.status

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
