//
//  CastingCell.swift
//  TVMaze
//
//  Created by Noémie on 07/03/2019.
//  Copyright © 2019 Noemie. All rights reserved.
//

import UIKit
import Foundation

class CastingCell: UITableViewCell{
    @IBOutlet var personName: UILabel!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var castingImage: UIImageView!
    
    var serie: Serie!
    
    var casting: Casting!
    
    func set(_ casting: Casting){
        
        self.casting = casting
        let imageUrl:URL = URL(string: casting.character.image.original.replacingOccurrences(of: "http", with: "https"))!
        
        // Start background thread so that image loading does not make app unresponsive
        DispatchQueue.global(qos: .userInitiated).async {
            print(imageUrl)
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            // When from background thread, UI needs to be updated on main_queue
            DispatchQueue.main.async {
                let imageMC = UIImage(data: imageData as Data)
                self.castingImage.image = imageMC
            }
        }
        personName.text = casting.person.name
        characterName.text = casting.character.name
        
    }
}


