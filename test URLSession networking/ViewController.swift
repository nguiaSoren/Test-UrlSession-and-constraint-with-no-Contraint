//
//  ViewController.swift
//  majin
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/14/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    let testImage:UIImageView = {
                    let image = UIImageView()
                    image.contentMode = .scaleAspectFill
                 
                 
        URLSession.shared.dataTask(with:URL(string: "https://images.unsplash.com/photo-1459550146610-232100af5511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1447&q=80")!) { (data, response, error) in
            guard error == nil, let data = data,let response = response as? HTTPURLResponse else {
                print(error!)
                            return
                        }
                        print(data)
            print(response)
         
                      DispatchQueue.main.async {
                          image.image = UIImage(data: data)
                      }
                        
                  }.resume()
                    
                    return image
                }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(testImage)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // By creating Viewheight and viewWith , we can constraint theimage to the center without any constraint by by calculation, it is much simpler.
        // By taking the half of the superViewSize minus the size of the objects we want to center, we can do it without constraint which can reduces some error
        let viewHeight = view.frame.height
        let viewWidth = view.frame.width
        
        let testImageWidth = 300
        let testImageHeight = 300
        testImage.frame = CGRect(x: viewWidth/2 - 150, y: viewHeight/2-150, width: 300, height: 300)
           testImage.clipsToBounds = true
           testImage.layer.cornerRadius = testImage.frame.height / 2
           
    }

}

