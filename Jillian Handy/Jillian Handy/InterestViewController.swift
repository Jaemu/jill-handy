//
//  InterestViewController.swift
//  Jillian Handy
//
//  Created by Munson, Jillian on 4/19/15.
//
//
//
//  ProjectViewController.swift
//  Jillian Handy
//
//  Created by Munson, Jillian on 4/19/15.
//
//

import Foundation
import UIKit

class InterestViewController: UIViewController {
    
    var interestPageViews: [String] = [
        "pyView",
        "wicsView",
        "corgiView",
        "cookView"
    ]
    var frame: CGRect = CGRectMake(0,0,0,0)
    @IBOutlet weak var interestScrollView: UIScrollView!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var interestLabel: UILabel!
    
    var sboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        createInterestScroller()
    }
    private func createInterestScroller() {
        let pyView = sboard.instantiateViewControllerWithIdentifier("pyView") as! UIViewController;
        
        for index in 0..<interestPageViews.count{
            frame.origin.x = self.interestScrollView.frame.size.width * CGFloat(index)
            frame.size = self.interestScrollView.frame.size
            interestScrollView.pagingEnabled = true
            if let page:UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier(interestPageViews[index]) as? UIViewController {
                
                page.view.frame = self.frame
                self.interestScrollView.addSubview(page.view)
            }
        }
        self.interestScrollView.contentSize = CGSizeMake(pyView.view.frame.size.width * CGFloat(interestPageViews.count), self.interestScrollView.frame.size.height)
        self.bgImage.image = UIImage(named: appTheme.imagePath)
        self.interestLabel.textColor = appTheme.textColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}