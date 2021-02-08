//
//  ViewController.swift
//  PageControl_Number
//
//  Created by Derrick on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    //--------
    // Fields
    //--------
    
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    

    let numPages = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = numPages
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        lblNumber.text = String(pageControl.currentPage + 1)
        colorChange(int: 0)
    }

    
    //--------
    // Actions
    //--------
    @IBAction func pageChange(_ sender: UIPageControl) {
        lblNumber.text = String(pageControl.currentPage + 1)
        colorChange(int: pageControl.currentPage)
    }
    
    // ColorChange
    func colorChange(int : Int){
        if ((int % 2) == 0) {
            lblNumber.textColor = UIColor.red
        }else{
            lblNumber.textColor = UIColor.blue
        }
   }
}


