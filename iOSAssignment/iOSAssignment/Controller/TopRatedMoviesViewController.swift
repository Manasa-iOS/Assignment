//
//  TopRatedMoviesViewController.swift
//  iOSAssignment
//
//  Created by Vickram Assomull on 03/04/21.
//  Copyright © 2021 Manasa Bommagani. All rights reserved.
//

import UIKit

class TopRatedMoviesViewController:UIViewController{
    //--------------------------------------------------
    // MarK : Story board variables
    //--------------------------------------------------
    @IBOutlet weak var topRatedTV: UITableView!
    
    //--------------------------------------------------
    // MarK : Custom variables
    //--------------------------------------------------
    var dataResponse : InformationModel!
    var selectedResult:Results?
    private var viewModel =  InformationViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.topRatedTV.delegate = self
        self.topRatedTV.dataSource = self
        self.topRatedTV.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        // Do any additional setup after loading the view.
    }
    //--------------------------------------------------
    // MarK : setupViewModel
    //--------------------------------------------------
    
    private func setupViewModel() {
        self.showLoader()
        self.viewModel.fetchData(url: "https://api.themoviedb.org/3/movie/top_rated?api_key=f1c5c2e15813d274946ac76c55c49811", success: { (response) in
            self.hideLoader()
            self.dataResponse = response
            print(self.dataResponse)
            self.topRatedTV.reloadData()
            
        }) { (Error) in
            self.hideLoader()
            print(Error)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MovieDetailsViewController
        vc.selectedResult = self.selectedResult
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
//--------------------------------------------------
// MarK : UITableViewDelegate, UITableViewDataSource methods
//--------------------------------------------------
extension TopRatedMoviesViewController: UITableViewDelegate,UITableViewDataSource {
 
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
        let cell = topRatedTV.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
        cell.movieTitle.text = dataResponse.results?[indexPath.row].title
        cell.selectionStyle = .none
        let imgURL = "https://image.tmdb.org/t/p/original/\(String(describing: (dataResponse.results?[indexPath.row].poster_path!)!))"
        print(imgURL)
        print(cell.movieTitle.text)
        ImageLoader().imageLoad(imgView: cell.movieImg, url: imgURL )
       // cell.delegate = self
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
