//
//  InformationViewModel.swift
//  iOSAssignment
//
//  Created by Vickram Assomull on 03/04/21.
//  Copyright © 2021 Manasa Bommagani. All rights reserved.
//

import Foundation
import Alamofire

class InformationViewModel {
    
    let sharedInstance = Connection()
    
    
    
    func fetchData(url : String, success:@escaping (InformationModel) -> Void, failure:@escaping (Error) -> Void)
    {
        let URL = url

        sharedInstance.requestGET(URL, params: nil, headers: nil, success: { (JSON) in
            
            let  result :Data? = JSON
            
            if result != nil
            {
                do
                {
                    let response = try JSONDecoder().decode(InformationModel.self, from: result!)
                    success(response)
                    
                }
                catch let error as NSError
                {
                    failure(error)
                }
            }
            
        }) { (Error) in
            failure(Error)
        }
        

    }

}
