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
        "meetupView"
    ]
    var frame: CGRect = CGRectMake(0,0,0,0)
    @IBOutlet weak var projectScrollView: UIScrollView!
    
    
    var sboard = UIStoryboard(name: "Main", bundle: nil)
    
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
                
                var delta = 0.2 * CGFloat(index)
                page.view.frame = self.frame
                self.projectScrollView.addSubview(page.view)
            }
        }
        self.projectScrollView.contentSize = CGSizeMake(nickView.view.frame.size.width * CGFloat(projectPageViews.count), self.projectScrollView.frame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}