//
//  Content.swift
//  Keychain
//
//  Created by Macbook on 5.12.21.
//

import UIKit

class Content: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func actionBack(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SignIn")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
