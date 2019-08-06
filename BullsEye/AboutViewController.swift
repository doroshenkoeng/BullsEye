//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Сергей Дорошенко on 31/07/2019.
//  Copyright © 2019 Сергей Дорошенко. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        } else {
            fatalError("The html file doesn't exit")
        }
    }
    
    @IBAction func touchCloseButton() {
        dismiss(animated: true, completion: nil)
    }

}
