//
//  ViewController.swift
//  PinchGesture
//
//  Created by Derrick on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    //--------
    // Fields
    //--------
    
    @IBOutlet var imgPinch: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Pinch Setup
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
        
    }
    
    // 현재 크기에 대비해서 늘리는것.
    @objc func doPinch(_ pinch:UIPinchGestureRecognizer){
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        
        // 다 한다음에 다시 1로 되도록 Setting.
        pinch.scale = 1
    }

}

