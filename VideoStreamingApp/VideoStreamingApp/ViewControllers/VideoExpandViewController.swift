//
//  VideoExpandViewController.swift
//  VideoStreamingApp
//
//  Created by Bridge on 25/08/23.
//

import UIKit
import WebKit

class VideoExpandViewController: UIViewController {
    var videoList : [VideoData] = [VideoData]()
    var videoKey : String?
    var HeadTitle : String?
    var HeadViews : String?
    var HeadDate : String?
    
    @IBOutlet weak var VideoWebView: WKWebView!
    @IBOutlet weak var secondTableView: UITableView!
    
    @IBOutlet weak var txtTags: UILabel!
    
    @IBOutlet weak var txtDate: UILabel!
    @IBOutlet weak var txtTitle: UILabel!
    
    @IBOutlet weak var txtViews: UILabel!
    let webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchVideoData()
        
        
    }
    
    
    
    
    func fetchVideoData() {
        
        guard let fileLocation = Bundle.main.url(forResource: "videos", withExtension: "json")
        else {
            return
        }
        
        DispatchQueue.main.async {
            
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let receivedData = try JSONDecoder().decode([VideoData].self, from: data)
                self.videoList = receivedData
                
                DispatchQueue.main.async {
                    self.secondTableView.reloadData()
                    self.secondTableView.dataSource = self
                    self.secondTableView.delegate = self
                    
                }
                
                
                if let videoKey = self.videoKey {
                    
                    let videoURL = "https://www.youtube.com/embed/\(videoKey)"
                    
                    if let url = URL(string: videoURL) {
                        let request = URLRequest(url: url)
                        self.VideoWebView.load(request)
                        
                    }
                }
            }
            
            
            catch {
                print(error)
            }
        }
    }
    
    
    
    
    
}

extension VideoExpandViewController : UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowData = videoList[indexPath.row]
        let secondCell = secondTableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as!
        SecondTableViewCell
        
        secondCell.secondTitle.text = rowData.title
        secondCell.secondDate.text = rowData.date
        secondCell.secondViews.text = rowData.view
        
        
        txtTags.text = rowData.tags.joined(separator: " ")
        txtTitle.text = HeadTitle
        txtDate.text = HeadDate
        txtViews.text = HeadViews
        return secondCell
    }
    
    
}

