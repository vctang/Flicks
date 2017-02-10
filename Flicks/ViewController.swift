//
//  ViewController.swift
//  Flicks
//
//  Created by Vicky Tang on 2/4/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    var movies: [NSDictionary]?
    var filteredData: [NSDictionary]!

    @IBOutlet weak var netErrView: UIView!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize a UIRefresh control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        // add refresh control to table view
        movieCollectionView.insertSubview(refreshControl, at: 0)
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        
        // Do any additional setup after loading the view.
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!
        
        //Display HUD Before request is made
        MBProgressHUD.showAdded(to: self.view, animated: true)
        netErrView.isHidden = false
        
        //Network request
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            //Hide HUD once network comes back
            MBProgressHUD.hide(for: self.view, animated: true)
            self.netErrView.isHidden = true
            
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(dataDictionary)
                    self.movies = dataDictionary["results"] as? [NSDictionary]
                    self.movieCollectionView.reloadData()
                }
            }
            
        }
        task.resume()
    }

    // Makes a network request to get updated data
    // Updates the movieCollectionView with the new data
    // Hides the RefreshControl
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!
        
        // ... Create the URLRequest `myRequest` ...
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Configure session so that completion handler is executed on main UI thread
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            // ... Use the new data to update the data source ...
            
            // Reload the movieCollectionView now that there is new data
            self.movieCollectionView.reloadData()
            
            // Tell the refreshControl to stop spinning
            refreshControl.endRefreshing()
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for:  indexPath as IndexPath) as! MovieCell
        
        let movie = self.movies![indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        let posterPath = movie["poster_path"] as! String
        let baseURL = "https://image.tmdb.org/t/p/w342"
        let imageURL = NSURL(string: baseURL + posterPath)
        
        cell.posterView.setImageWith(imageURL! as URL)
        
        print("row \(indexPath.row)")
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}