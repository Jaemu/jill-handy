//
//  SkillViewController.swift
//  Jillian Handy
//
//  Created by Munson, Jillian on 4/19/15.
//
//

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

class SkillViewController: UIViewController {
    
    var skillPageViews: [String] = [
        "jsView",
        "javaView",
        "pythonView",
        "swiftView"
    ]
    var frame: CGRect = CGRectMake(0,0,0,0)
    @IBOutlet weak var skillScrollView: UIScrollView!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var skillsLabel: UILabel!
    
    var sboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        createSkillScroller()
    }
    private func createSkillScroller() {
        let jsView = sboard.instantiateViewControllerWithIdentifier("jsView") as UIViewController;
        
        for index in 0..<skillPageViews.count{
            frame.origin.x = self.skillScrollView.frame.size.width * CGFloat(index)
            frame.size = self.skillScrollView.frame.size
            skillScrollView.pagingEnabled = true
            if let page:UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier(skillPageViews[index]) as? UIViewController {
                
                page.view.frame = self.frame
                self.skillScrollView.addSubview(page.view)
            }
        }
        self.skillScrollView.contentSize = CGSizeMake(jsView.view.frame.size.width * CGFloat(skillPageViews.count), self.skillScrollView.frame.size.height)
        self.bgImage.image = UIImage(named: appTheme.imagePath)
        self.skillsLabel.textColor = appTheme.textColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
