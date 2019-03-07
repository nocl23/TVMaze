//
//  EpisodeTableController.swift
//  TVMaze
//
//  Created by Noémie on 07/03/2019.
//  Copyright © 2019 Noemie. All rights reserved.
//

import UIKit

class EpisodeTableController: UITableViewController{
    
    private let reuseIdentifier = "EpisodeCell"
    
    var episodes = [Episode]()
    var serie: Serie!
    
    @IBOutlet var episodeTitle: UILabel!
    @IBOutlet var id: UILabel!
    @IBOutlet var season: UILabel!
    @IBOutlet var number: UILabel!
    @IBOutlet var url: UILabel!
    @IBOutlet var airstamp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let task = API.getEpisode(id: serie.id) { (episodes, error) in
            DispatchQueue.main.async {
                self.episodes = episodes!
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EpisodeCell
        
        let episode = self.episodes[indexPath.row]
        cell.set(episode)
        return cell
    }
}

