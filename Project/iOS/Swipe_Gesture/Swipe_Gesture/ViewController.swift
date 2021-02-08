//
//  ViewController.swift
//  Swipe_Gesture
//
//  Created by Derrick on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    //--------
    // Fields
    //--------
    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    
    // 변수 선언
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    // 두 손가락
    let numOfTouches = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이미지 할당해주는 함수
        makeImages()
        
        // 초기 화면 구성
        imgViewUp.image = imgUp[0]
        imgViewUp.image = imgDown[0]
        imgViewUp.image = imgLeft[0]
        imgViewUp.image = imgRight[0]
        
        // 한 손가락 Gesture 구성
        makeSingleTouch()
        
        // 두 손가락 Gesture 구성
        makeDoubleTouch()
    }

    
    
    // 이미지 할당해주는 함수
    func makeImages(){
        // 0번 부터 2번 까지
        // 손가락 하나로 되는것.
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
    }
    
    // 한 손가락 Gesture 구성
    // 여기서 부터 방향을 정하는 것이 아주 중요
    func makeSingleTouch(){
        // action-> hardware 때문에 object C 가 등장
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        // Direction.up 을 인식하면 밑의 switch 문으로 가는 것
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        // Direction.down 을 인식하면 밑의 switch 문으로 가는 것
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
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
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            default:
                break
            }
        }
    }
    
    // option + shift + 방향
    // 두 손가락 터치
    func makeDoubleTouch(){
        // action-> hardware 때문에 object C 가 등장
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        // Direction.up 을 인식하면 밑의 switch 문으로 가는 것
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        // 몇개 짜리냐? -> 2개
        // let numOfTouches = 2
        swipeUpMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUpMulti)
        
        // action-> hardware 때문에 object C 가 등장
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        // Direction.up 을 인식하면 밑의 switch 문으로 가는 것
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        // 몇개 짜리냐? -> 2개
        // let numOfTouches = 2
        swipeDownMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDownMulti)
        
        // action-> hardware 때문에 object C 가 등장
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        // Direction.up 을 인식하면 밑의 switch 문으로 가는 것
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        // 몇개 짜리냐? -> 2개
        // let numOfTouches = 2
        swipeLeftMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        // action-> hardware 때문에 object C 가 등장
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        // Direction.up 을 인식하면 밑의 switch 문으로 가는 것
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        // 몇개 짜리냐? -> 2개
        // let numOfTouches = 2
        swipeRightMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRightMulti)
    }
    // option + shift + 방향
    // UP, Down, Left, Right
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            // color 처음에 black 으로 체운다
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            default:
                break
            }
        }
    }
    
    
    
    
    
    
}//----END

