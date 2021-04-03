//
//  TabbarController.swift
//  iOSAssignment
//
//  Created by Vickram Assomull on 03/04/21.
//  Copyright © 2021 Manasa Bommagani. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

   override func viewDidLoad() {
            super.viewDidLoad()
            let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0)]
            UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)

            // Do any additional setup after loading the view.
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
