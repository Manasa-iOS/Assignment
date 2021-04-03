//
//  Connection.swift
//  iOSAssignment
//
//  Created by Vickram Assomull on 03/04/21.
//  Copyright © 2021 Manasa Bommagani. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class Connection {
    
    func requestGET(_ url: String, params : Parameters?,headers : [String : String]?, success:@escaping (Data) -> Void, failure:@escaping (Error) -> Void)
    {
        do
        {
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON
                {
                    (response) in
                    switch response.result
                    {
                    case .success:
                        if let data = response.data
                        {
                            success(data)
                        }
                    case .failure(let error):
                        failure(error)
                    }
            }
                        
        }
        catch let JSONError as NSError
        {
            failure(JSONError)
        }
        
    }
}

