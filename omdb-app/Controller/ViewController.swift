//
//  ViewController.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addMovie(sender: AnyObject) {
        let addMovieVC = self.storyboard?.instantiateViewControllerWithIdentifier("addMovieVC")
        if let addMovieVC = addMovieVC {
            self.navigationController?.pushViewController(addMovieVC, animated: true)
        }
    }

}

