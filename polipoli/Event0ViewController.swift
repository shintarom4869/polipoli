//
//  Event0ViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/1/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit

class Event0ViewController: UIViewController,UIWebViewDelegate {
    
    //url受け取り用
    var url = String()

    @IBOutlet var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwordButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        let url = URL(string: "\(self.url)")
        let urlRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
    }
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        //インディケーター開始
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        //インディケーター終了
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

        self.backButton.isEnabled = self.webView.canGoBack
        self.forwordButton.isEnabled = self.webView.canGoForward

    }
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        if (error as! URLError).code == URLError.cancelled {
            return
        }
        self.showAlert("Network Error")
        self.webView.stopLoading()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    @IBAction func goBack(_ sender: Any) {

        self.webView.goBack()
    }
    @IBAction func goForword(_ sender: Any) {
        self.webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        self.webView.reload()
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
