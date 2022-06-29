//
//  DetailViewController.swift
//  project1
//
//  Created by student on 4/17/20.
//  Copyright © 2020 Orvil Billionaire club. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String? //name of the image to load
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imagetoLoad = selectedImage{
            imageView.image = UIImage(named: imagetoLoad)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
        // Do any additional setup after loading the view.
    }
    @objc func shareTapped(){
        guard  let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }
    

}
