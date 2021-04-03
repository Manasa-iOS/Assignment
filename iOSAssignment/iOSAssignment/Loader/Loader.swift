//
//  Loader.swift
//  iOSAssignment
//
//  Created by Vickram Assomull on 03/04/21.
//  Copyright © 2021 Manasa Bommagani. All rights reserved.
//

import Foundation
import SDWebImage
import MBProgressHUD

//---------------------------------------------------------
// MARK: - loader Creation Functionality
//---------------------------------------------------------


class Loader {
    
    static func showAdded(to view: UIView, animated: Bool){
        MBProgressHUD.showAdded(to: view, animated: animated)
    }
    
    static func hide(for view: UIView, animated: Bool){
        MBProgressHUD.hide(for: view, animated: animated)
    }
}

extension UIViewController {
    
    func showLoader(animated: Bool = false) {
        Loader.showAdded(to: self.view, animated: animated)
    }
    
    func hideLoader(animated: Bool = false) {
        Loader.hide(for: self.view, animated: animated)
    }
}


class ImageLoader
{
    func imageLoad(imgView :UIImageView,url :String)
    {
        imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
    }
}

