import UIKit

class SerieDetailController: UIViewController{
    //@IBOutlet weak var titleLabel: UILabel!
    
    var serie: Serie!
    
    
    @IBOutlet var serieTitle: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var status: UILabel!
    @IBOutlet var category: UILabel!
    @IBOutlet var serieDescription: UILabel!
    @IBOutlet var channel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start background thread so that image loading does not make app unresponsive
       
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
        
        var categories = "Categories : "
        for category in serie.genres {
            categories += category + " "
        }
        
        serieTitle.text = serie.name
        channel.text = "Web channel : \(serie.network?.name)"
        status.text = "Status : \(serie.status) "
        category.text = categories
        serieDescription.text = "Description : \(serie.summary) "
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? EpisodeTableController{
            destinationVC.serie = self.serie
        }
        
        if let destinationVC = segue.destination as? CastingTableController{
            destinationVC.serie = self.serie
        }
    }
    
}
