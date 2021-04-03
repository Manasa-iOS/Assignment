//
//  MovieDetailsViewController.swift
//  iOSAssignment
//
//  Created by Vickram Assomull on 03/04/21.
//  Copyright © 2021 Manasa Bommagani. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    //--------------------------------------------------
    // MarK : Story board variables
    //--------------------------------------------------
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var popularityLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var voteCountLbl: UILabel!
    @IBOutlet weak var voteAvgLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    //--------------------------------------------------
       // MarK : Custom variables
       //--------------------------------------------------
      
    var selectedResult:Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        // Do any additional setup after loading the view.
    }
    
    //--------------------------------------------------
    // MarK : Details of selected movie
    //--------------------------------------------------
         
    override func viewWillAppear(_ animated: Bool) {
        titleLbl.text = selectedResult?.title
          let imgURL = "https://image.tmdb.org/t/p/original/\(String(describing: (selectedResult?.poster_path!)!))"
          print(imgURL)
        //  print(cell.movieTitle.text)
          ImageLoader().imageLoad(imgView: movieImg, url: imgURL )
          overviewLbl.text = selectedResult?.overview
          popularityLbl.text = "\(String(describing: (selectedResult?.popularity)!))"
          releaseDateLbl.text = selectedResult?.release_date
          voteCountLbl.text = "\(String(describing: (selectedResult?.vote_count)!))"
          voteAvgLbl.text = "\(String(describing: (selectedResult?.vote_average)!))"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

