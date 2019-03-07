//
//  SeriePhotoViewController.swift
//  TVMaze
//
//  Created by Noémie on 03/03/2019.
//  Copyright © 2019 Noemie. All rights reserved.
//

import UIKit

class SeriePhotoViewController: UICollectionViewController {
    
    private let reuseIdentifier = "SerieCell"
    
    var series = [Serie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let task = API.showSeries { (series, error) in
            DispatchQueue.main.async {
                self.series = series
                self.collectionView.reloadData()
            }
        }
        task.resume()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SerieDetailController,
            let cell = sender as? SerieCell{
            destinationVC.serie = cell.serie
        }
    }
 
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SerieCell
    
        let serie = self.series[indexPath.row]
        cell.set(serie)
    
        return cell
    }

}
