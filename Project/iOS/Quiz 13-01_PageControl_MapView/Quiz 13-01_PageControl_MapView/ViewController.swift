//
//  ViewController.swift
//  Quiz 13-01_PageControl_MapView
//
//  Created by Derrick on 2021/02/08.
//

import UIKit
import MapKit//<---- 꼭 추가 해야하는 부분

class ViewController: UIViewController, CLLocationManagerDelegate {

    //-------------
    // Fields
    //-------------
    
    // Map View
    @IBOutlet weak var myMap: MKMapView!
    
    // 위치 Names
    @IBOutlet weak var lblLocationInfo: UILabel!
    
    //CLLocationManager 정의하기
    let locationManager = CLLocationManager()
    
    // PageControl
    @IBOutlet weak var pageControl: UIPageControl!
    
    var locations = 4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label 써져 있는거 깨끗히 만들기
        lblLocationInfo.text = ""
        
        pageControl.numberOfPages = locations
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        setAnnotation(latitudeValue: 37.5878892, longitideValue: 127.0037098, delta: 0.01, title: "혜화문", subTitle: "서울 특별시 도봉구 1길 6")
        self.lblLocationInfo.text = "혜화문"
        

    }

    //-------------
    // Actions
    //-------------
    
    

    
    // 위도와 경도에 대한 함수
    // 위치가 업데이트 되었을때 지도의 위치를 표시하는 함수
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span: Double)
    -> CLLocationCoordinate2D
    {
        // 지역
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        // 확장
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        // center: 어디가 Center이니?    -->  span:얼만큼 늘릴거야?
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        // return 값에 위도 경도 값이 다들어가 있는것이다.
        return pLocation
    }
    
    
    // Pin 설치 하기
    // 특정 위도와 경도에 핀 설치하고 핀에 타이틀과 서브 타이틀의 문자열 표시
    func setAnnotation(latitudeValue : CLLocationDegrees, longitideValue : CLLocationDegrees, delta span : Double, title strTitle: String, subTitle strSubtitle :String){
        
        //Pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitideValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
        
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        // 0 이면 제일 처음에 있는 위치이다.
        // 혜화문
        if pageControl.currentPage == 0 {
            setAnnotation(latitudeValue: 37.5878892, longitideValue: 127.0037098, delta: 0.01, title: "혜화문", subTitle: "서울 특별시 도봉구 1길 6")
            self.lblLocationInfo.text = "혜화문"
            locationManager.startUpdatingLocation()

        }
        // 1 --> Pin
        // 흥인지문
        // 핀을 설치하고 위치 정보 표시
        else if pageControl.currentPage == 1 {
            setAnnotation(latitudeValue: 37.5711907, longitideValue: 127.009506, delta: 0.01, title: "흥인지문", subTitle: "서울 특별시 도봉구 1길 6")
            self.lblLocationInfo.text = "흥인지문"
        }
        // 2
        // 창의문
        // 핀을 설치하고 위치 정보 표시
        else if pageControl.currentPage == 2 {
            setAnnotation(latitudeValue: 37.5926027, longitideValue: 126.9664771, delta: 0.01, title: "창의문", subTitle: "서울 특별시 서대문구 통일로 251")
            self.lblLocationInfo.text = "창의문"
        }
        // 3
        // 숙정문
        // 핀을 설치하고 위치 정보 표시
        else if pageControl.currentPage == 3 {
            setAnnotation(latitudeValue: 37.5956584, longitideValue: 126.9810576, delta: 0.01, title: "숙정문", subTitle: "서울 특별시 서대문구 통일로 251")
            self.lblLocationInfo.text = "숙정문"
        }
        
        
    }
    
    
    
}//---END

