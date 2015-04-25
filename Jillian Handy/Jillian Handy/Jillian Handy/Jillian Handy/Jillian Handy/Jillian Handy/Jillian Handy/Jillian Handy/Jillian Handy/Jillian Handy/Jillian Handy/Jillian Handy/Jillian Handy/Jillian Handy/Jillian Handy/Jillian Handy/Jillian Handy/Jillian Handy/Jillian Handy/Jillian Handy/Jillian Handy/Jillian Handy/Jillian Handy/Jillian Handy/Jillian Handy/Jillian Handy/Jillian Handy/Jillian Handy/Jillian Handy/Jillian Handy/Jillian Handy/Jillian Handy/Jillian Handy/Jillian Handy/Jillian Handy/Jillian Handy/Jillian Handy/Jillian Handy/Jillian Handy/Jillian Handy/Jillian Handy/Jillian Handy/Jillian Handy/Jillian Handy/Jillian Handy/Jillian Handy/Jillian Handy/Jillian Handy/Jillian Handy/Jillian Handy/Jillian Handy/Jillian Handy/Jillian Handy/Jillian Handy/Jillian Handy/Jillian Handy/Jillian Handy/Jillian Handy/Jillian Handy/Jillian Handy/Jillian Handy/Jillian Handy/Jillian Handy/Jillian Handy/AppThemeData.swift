//
//  ThemeData.swift
//  Jillian Handy
//
//  Created by Munson, Jillian on 4/24/15.
//
//

import Foundation
import UIKit

class AppThemeData{
    var themeName: String
    var textColor: UIColor
    var backgroundColor: UIColor
    var imagePath: String

    
    init(){
        self.themeName = "clear-day"
        self.textColor = UIColor.blackColor()
        self.backgroundColor = UIColor.whiteColor()
        self.imagePath = "clear-day.jpg"
    }
    
    init(name: String, color: UIColor, bgcolor: UIColor, img: String){
        self.themeName = name
        self.textColor = color
        self.backgroundColor = bgcolor
        self.imagePath = img
    }
    func changeLabelsInViewToTheme(view: UIView) -> [UILabel] {
        var results = [UILabel]()
        for subview in view.subviews as [UIView] {
            if let labelView = subview as? UILabel {
                labelView.textColor = self.textColor
                results += [labelView]
            } else {
                results += changeLabelsInViewToTheme(subview)
            }
        }
        return results
    }
    func setBgColorToTheme(view: UIView) -> Void{
        view.backgroundColor = self.backgroundColor;
    }
}

var AppThemes = [
    "clear-day": AppThemeData(),
    "clear-night": AppThemeData(name: "clear-night", color:UIColor.cyanColor(), bgcolor: UIColor.lightGrayColor(), img: "clear-night"),
    "rain": AppThemeData(name: "rain", color:UIColor.whiteColor(), bgcolor: UIColor.blackColor(), img: "rain.jpg"),
    "snow": AppThemeData(name: "snow", color:UIColor.blackColor(), bgcolor: UIColor.blackColor(), img: "snow.png"),
    "sleet": AppThemeData(name: "sleet", color:UIColor.whiteColor(), bgcolor: UIColor.blackColor(), img: "rain.jpg"),
    "wind": AppThemeData(name: "wind", color:UIColor.whiteColor(), bgcolor: UIColor.blackColor(), img: "wind.png"),
    "fog": AppThemeData(name: "fog", color:UIColor.whiteColor(), bgcolor: UIColor.blackColor(), img: "fog.png"),
    "cloudy": AppThemeData(name: "cloudy", color:UIColor.whiteColor(), bgcolor: UIColor.blackColor(), img: "cloudy.png"),
    "partly-cloudy-day": AppThemeData(name: "partly-cloudy-day", color:UIColor.whiteColor(), bgcolor: UIColor.blackColor(), img: "partly-cloudy-day.jpg"),
    "partly-cloudy-night": AppThemeData(name: "partly-cloudy-night", color:UIColor.cyanColor(), bgcolor: UIColor.blackColor(), img: "partly-cloudy.jpg")
]

var appTheme: AppThemeData = AppThemeData.init()