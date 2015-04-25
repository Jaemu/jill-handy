//
//  ProjectViewController.swift
//  Jillian Handy
//
//  Created by Munson, Jillian on 4/19/15.
//
//

import Foundation
import UIKit

class ProjectViewController: UIViewController {
    
    var projectPageViews: [String] = [
        "nickView",
        "meetupView",
        "cancerView",
        "googleView",
        "apacheView",
        "appView"
    ]
    var frame: CGRect = CGRectMake(0,0,0,0)
    
    var sboard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var projectScrollView: UIScrollView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var projectsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        createProjectScroller()
    }
    private func createProjectScroller() {
        let nickView = sboard.instantiateViewControllerWithIdentifier("nickView") as UIViewController;
        let meetupView = sboard.instantiateViewControllerWithIdentifier("meetupView") as UIViewController;
        
        for index in 0..<projectPageViews.count{
            frame.origin.x = self.projectScrollView.frame.size.width * CGFloat(index)
            frame.size = self.projectScrollView.frame.size
            projectScrollView.pagingEnabled = true
            if let page:UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier(projectPageViews[index]) as? UIViewController {
                
                if page.view.frame.size.height > frame.size.height {
                    frame.size = page.view.frame.size
                }
                page.view.frame = self.frame
                self.projectScrollView.addSubview(page.view)
            }
        }
        self.projectScrollView.contentSize = CGSizeMake(nickView.view.frame.size.width * CGFloat(projectPageViews.count), self.projectScrollView.frame.size.height)
        self.bgImage.image = UIImage(named: appTheme.imagePath)
        self.projectsLabel.textColor = appTheme.textColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}