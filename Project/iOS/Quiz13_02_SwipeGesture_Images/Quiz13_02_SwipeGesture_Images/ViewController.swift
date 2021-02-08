//
//  ViewController.swift
//  Quiz13_02_SwipeGesture_Images
//
//  Created by Derrick on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    //---------------
    // Fields
    //---------------
    
    // Page Controller
    @IBOutlet weak var pageControl: UIPageControl!
    // Image View
    @IBOutlet weak var imgView: UIImageView!
    
    //Array_for Images
    var images = ["flower_01.png","flower_02.png"
                  ,"flower_03.png","flower_04.png"
                  ,"flower_05.png","flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 페이지가 6개이구나??
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        imgView.image = UIImage(named: images[0])
        
        // 한 손가락 Gesture 구성
        makeSingleTouch()
    }
    //---------------
    // Actions
    //---------------
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        // 오른쪽 클릭하면 자동적으로 Default가 1번으로 바뀐다.
        imgView.image = UIImage(named: images[pageControl.currentPage])
        // 한 손가락 Gesture 구성
        makeSingleTouch()
    }

    
    // 한 손가락 Gesture 구성
    // 여기서 부터 방향을 정하는 것이 아주 중요
    func makeSingleTouch(){

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        // Direction.left 을 인식하면 밑의 switch 문으로 가는 것
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        // Direction.right 을 인식하면 밑의 switch 문으로 가는 것
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    // UP, Down, Left, Right
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            // color 처음에 black 으로 체운다
            imgView.image = UIImage(named:images[0])
            
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left:
                    if pageControl.currentPage < pageControl.numberOfPages - 1 {
                        pageControl.currentPage = pageControl.currentPage + 1
                        imgView.image = UIImage(named:images[pageControl.currentPage])
                }
                case UISwipeGestureRecognizer.Direction.right:
                    if pageControl.currentPage > 0 {
                        pageControl.currentPage = pageControl.currentPage - 1
                        imgView.image = UIImage(named:images[pageControl.currentPage])
                    }
                default:
                    break
                }
           
 
        }
    }
    
    
    
}

