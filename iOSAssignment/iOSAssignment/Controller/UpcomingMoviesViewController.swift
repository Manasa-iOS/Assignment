//
//  UpcomingMoviesViewController.swift
//  iOSAssignment
//
//  Created by Vickram Assomull on 03/04/21.
//  Copyright © 2021 Manasa Bommagani. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UIViewController {
   //--------------------------------------------------
   // MarK : Story board variables
   //--------------------------------------------------
    @IBOutlet weak var upcomingTV: UITableView!
   
     //--------------------------------------------------
     // MarK : Custom variables
     //--------------------------------------------------
    
    var dataResponse : InformationModel!
    var selectedResult:Results?
    private var viewModel =  InformationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        upcomingTV.delegate = self
        upcomingTV.dataSource = self
        self.upcomingTV.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        // Do any additional setup after loading the view.
    }
       //--------------------------------------------------
       // MarK : setupViewModel
       //--------------------------------------------------
    private func setupViewModel() {
        self.showLoader()
        self.viewModel.fetchData(url: "https://api.themoviedb.org/3/movie/upcoming?api_key=f1c5c2e15813d274946ac76c55c49811", success: { (response) in
            self.hideLoader()
            self.dataResponse = response
            self.selectedResult = response.results?[0]
            print(self.dataResponse)
            self.upcomingTV.reloadData()
            
        }) { (Error) in
            self.hideLoader()
            print(Error)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MovieDetailsViewController
        vc.selectedResult = self.selectedResult
    }

   

}
//--------------------------------------------------
// MarK : UITableViewDelegate, UITableViewDataSource methods
//--------------------------------------------------
extension UpcomingMoviesViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (dataResponse?.results?.count ?? 0) > 0
        {
            return dataResponse.results?.count ?? 0
        }
        else
        {
            return 0
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = upcomingTV.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.movieTitle.text = dataResponse.results?[indexPath.row].title
        let imgURL = "https://image.tmdb.org/t/p/original/\(String(describing: (dataResponse.results?[indexPath.row].poster_path!)!))"
        print(imgURL)
        print(cell.movieTitle.text)
        ImageLoader().imageLoad(imgView: cell.movieImg, url: imgURL )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           self.selectedResult = dataResponse.results?[indexPath.row]
           performSegue(withIdentifier: "detailsSegue", sender: nil)
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/8
        }
}

 

