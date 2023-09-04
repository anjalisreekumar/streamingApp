

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var firstTableView: UITableView!
    
    var videoList : [VideoData] = [VideoData]()
    var selectedIndexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        
        
    }
    
    
    
    func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "videos" , withExtension: "json")
        else {
            return
        }
        
        do
        {
            let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([VideoData].self, from: data)
            self.videoList = receivedData
            
            DispatchQueue.main.async {
                
                self.firstTableView.reloadData()
                self.firstTableView.delegate = self
                self.firstTableView.dataSource = self
                
            }
            
            
        }
        
        catch
        {
            print(error)
        }
        
    }
    
    
    
    
    
    
}



extension HomeViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstCell = firstTableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! MyTableViewCell
        
        let rowData = videoList[indexPath.row]
        firstCell.txtTitle.text = rowData.title
        firstCell.txtChannel.text = rowData.channel
        firstCell.txtViews.text = rowData.view
        firstCell.txtDate.text = rowData.date
        firstCell.txtTags.text = rowData.tags.joined(separator: " ")
        
        
        
        
        
        let imgUrlKey = "https://img.youtube.com/vi/\(rowData.video_key)/0.jpg"
        
        if let imgUrl = URL(string: imgUrlKey) {
            URLSession.shared.dataTask(with: imgUrl) { data, response, error in
                if let imageData = data,
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        firstCell.videoImageView.image = image
                    }
                }
            }.resume()
        }
        
        
        return firstCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueId" {
            if let indexPath = selectedIndexPath,
               let detailViewController = segue.destination as? VideoExpandViewController {
                let videoKey = videoList[indexPath.row].video_key
                let title = videoList[indexPath.row].title
                let views = videoList[indexPath.row].view
                let date = videoList[indexPath.row].date
                detailViewController.HeadDate = date
                detailViewController.HeadViews = views
                detailViewController.HeadTitle = title
                detailViewController.videoKey = videoKey
                
            }
        }
    }
}

