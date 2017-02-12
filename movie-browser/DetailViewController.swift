//
//  DetailViewController.swift
//  movie-browser
//
//  Created by Vicky Tang on 2/7/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var rateColorView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!

    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        let release = movie["release_date"] as! String
        let index = release.index(release.startIndex, offsetBy: 4)
        let year = release.substring(to: index)
        
        let title = movie["title"] as! String
        titleLabel.text = "\(title) (\(year))"
        
        let overview = movie["overview"]
        overviewLabel.text = overview as? String
        overviewLabel.sizeToFit()
        
        let rating = movie["vote_average"] as! Double
        ratingLabel.text = String(rating)
        
        if(rating < 5){
            rateColorView.backgroundColor = UIColor(red: 209/255, green: 50/255, blue: 23/255, alpha: 1)
        } else if(rating >= 5 && rating < 7) {
            rateColorView.backgroundColor = UIColor(red: 209/255, green: 177/255, blue: 0/255, alpha: 1)
        } else {
            rateColorView.backgroundColor = UIColor(red: 30/255, green: 168/255, blue: 55/255, alpha: 1)
        }

        print(movie)
        
        let baseURL = "https://image.tmdb.org/t/p/w342"
        
        if let posterPath = movie["poster_path"] as? String {
            let imageURL = NSURL(string: baseURL + posterPath)
            posterImageView.setImageWith(imageURL! as URL)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
