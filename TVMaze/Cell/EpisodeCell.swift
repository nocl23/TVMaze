//
//  EpisodeCell.swift
//  TVMaze
//
//  Created by Noémie on 07/03/2019.
//  Copyright © 2019 Noemie. All rights reserved.
//

import UIKit
import Foundation

class EpisodeCell: UITableViewCell{
    @IBOutlet var info: UILabel!
    @IBOutlet var airstamp: UILabel!
    var serie: Serie!
    
    var episode: Episode!
    
    func set(_ episode: Episode){
        
        self.episode = episode
        
        info.text = "\(episode.season)x\(episode.number): \(episode.name)"
        
        var dateString = episode.airstamp // change to your date format
        
        let format        = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        var dateUnformatted = (format.date(from: dateString))!
        format.dateFormat = "dd, yyyy"
        var dateFormatted = format.string(from:dateUnformatted)
        let calendar = Calendar.current
        let month = calendar.component(.month, from: dateUnformatted)
        let a = format.monthSymbols[month - 1]
        
        
        airstamp.text = " \(a) \(dateFormatted)"
        
    }
}

