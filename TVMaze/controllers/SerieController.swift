//
//  ViewController.swift
//  TVMaze
//
//  Created by Noémie on 25/02/2019.
//  Copyright © 2019 Noemie. All rights reserved.
//

import UIKit

class SerieController: UICollectionViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet var id: UILabel!
    
    var serie: Serie!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = serie.name
        id.text = "\(serie.id)"
    }
    
}
