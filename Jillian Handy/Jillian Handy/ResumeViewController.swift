//
//  ResumeViewController.swift
//  Jillian Handy
//
//  Created by Munson, Jillian on 4/19/15.
//
//

import Foundation
import UIKit

class ResumeViewController: UIViewController {
    
    @IBOutlet weak var resumeWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name:String? = ("F2013");
        let termsPath:String? = NSBundle.mainBundle().pathForResource(name, ofType: "pdf")!
        let url = NSURL(fileURLWithPath: termsPath!)
        let pdfRequest = NSURLRequest(URL: url!)
        resumeWebView?.loadRequest(pdfRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}