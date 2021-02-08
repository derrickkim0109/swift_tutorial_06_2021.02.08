//
//  ViewController.swift
//  SegmentControl_MapView_01
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
    
    // 현재 위치
    @IBOutlet weak var lblLocationInfo1: UILabel!
    
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    //CLLocationManager 정의하기
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label 써져 있는거 깨끗히 만들기
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        
        // delegate 설정 self
        locationManager.delegate = self
        // GPS 정확도를 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 데이터를 허용할지를 확인하기 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트 시작
        locationManager.startUpdatingLocation()
        
        // 위치 보기 설정
        // 지도와 GPS 연결
        myMap.showsUserLocation = true
    }
    //-------------
    // Actions
    //-------------
    
    // 세크먼트 컨트롤을 선택하였을 때 호출
    // Segment option lists
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        // 0 이면 제일 처음에 있는 위치이다.
        // GPS
        // 현재 위치
        if sender.selectedSegmentIndex == 0 {
            // "현재 위치" 선택 - 현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
        }
        // 1 --> Pin
        // 둘리 뮤지엄
        // GPS 신호가 아니기 때문에 내가 표시해줘야 하니까 다 적어줘야함.
        // 핀을 설치하고 위치 정보 표시
        else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.65243153, longitideValue: 127.0276397, delta: 0.01, title: "둘리 뮤지엄", subTitle: "서울 특별시 도봉구 1길 6")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "둘리 뮤지엄"
        }
        // 2
        // 서대문 형무소 역사관
        // 핀을 설치하고 위치 정보 표시
        else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.57244171, longitideValue: 126.9595412, delta: 0.01, title: "서대문 형무소 역사관", subTitle: "서울 특별시 서대문구 통일로 251")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "서대문 형무소 역사관"
        }
        
    }
    
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
    
    // 위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
    // 지도 업데이트 됬을때 위치 맞춰주는것.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        
        // 지도 100배 확대
        // latitudeValue: GPS 가 주는 값
        // delta 0.01 이 100배 늘려준다는 의미
       _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) ->Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            // 지금 주소
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
        })
        // 끝났을 때
        locationManager.stopUpdatingLocation()
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
    
    
    
}///-----END

