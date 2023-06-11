//
//  ViewController.swift
//  OneShare
//
//  Created by NastiaGusev on 11/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapShare(_ sender: Any) {
        sendGif(strUrl: "https://cmsone.inmanage.com/_media/media/49/741.gif?t=1672730905")
    }
    
    func sendGif(strUrl: String) {
        guard let fileURL = URL(string: strUrl) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: fileURL) { (data, response, error) in
            guard let gifData = data else {
                if let error = error {
                    print("Failed to download GIF data: \(error)")
                }
                return
            }
            
            DispatchQueue.main.async {
                let activityViewController = UIActivityViewController(activityItems: [gifData], applicationActivities: nil)
                activityViewController.setValue(self.title, forKey: "subject")
                self.present(activityViewController, animated: true, completion: nil)
            }
        }
        task.resume()
    }

}

