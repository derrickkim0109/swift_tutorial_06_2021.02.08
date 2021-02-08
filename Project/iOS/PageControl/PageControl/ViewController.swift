//
//  ViewController.swift
//  PageControl
//
//  Created by Derrick on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    //------------
    // Fields
    //------------
    
    // Image View
    @IBOutlet weak var imgView: UIImageView!
    // Page Controller
    @IBOutlet weak var pageControl: UIPageControl!
    
    //Array_for Images
    var images = ["flower_01.png","flower_02.png"
                  ,"flower_03.png","flower_04.png"
                  ,"flower_05.png","flower_06.png",]
    
    
    // 첫 화면
    override func viewDidLoad() {
        super.viewDidLoad()
        // 페이지가 6개이구나??
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        imgView.image = UIImage(named: images[0])
    }
    
    //------------
    // Actions
    //------------
    
    // Page Control_Action
    @IBAction func pageChange(_ sender: UIPageControl) {
        // 오른쪽 클릭하면 자동적으로 Default가 1번으로 바뀐다.
        imgView.image = UIImage(named: images[pageControl.currentPage])

    }
    

}

