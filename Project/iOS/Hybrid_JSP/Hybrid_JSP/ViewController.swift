//
//  ViewController.swift
//  Hybrid_JSP
//
//  Created by Derrick on 2021/02/08.
//

import UIKit
import WebKit //****

class ViewController: UIViewController,WKNavigationDelegate {
    // ----------
    // Fields
    // ----------
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var myWebView: WKWebView!
    
    @IBOutlet weak var txtUrl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        
        // 초기 화면 : www.naver.com -> function을 만들어라
        loadWebPage(url: "http://192.168.2.13:8080/jsp/ResponseAge_01.jsp")
    }

    // Tool Bar

    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()

    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    // url 넣기
    func loadWebPage(url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    // commit은 시작이다.
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // Error 발생
    // 사이트 연결 안되거나 , 없어졌을경우
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // btnGo
    //_ url 쓸때 안보임
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        
        //false 인경우
        if !flag{
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    // softkeyboard TouchesBegan function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    
}////END

