import UIKit

class SerieCell: UICollectionViewCell{
    
    @IBOutlet weak var image: UIImageView!
    
    var serie: Serie!
    
    
    func set(_ serie: Serie){
        
        self.serie = serie
        
        let aString = serie.image.medium
        let newString = aString.replacingOccurrences(of: "http", with: "https")
        let urlImage = URL(string: newString)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: urlImage!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            if let image = UIImage(data: data!) {
                DispatchQueue.main.async {
                    self.image.image = image
                }
            }
        }
    }
}
