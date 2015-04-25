//
//  HomeViewController.swift
//  Jillian Handy
//
//  Created by Munson, Jillian on 4/21/15.
//
//

import Foundation
import UIKit
import CoreLocation

struct ApiData{
    var apiUrlPath: String
    var loc: CLLocationCoordinate2D
    init(url: String, loc: CLLocationCoordinate2D){
        self.apiUrlPath = url
        self.loc = loc
    }
}

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    required init(coder aDecoder: NSCoder!) {
        self.weatherData = NSMutableData()
        self.locManager = CLLocationManager()
        self.apiData = ApiData(url: "https://api.forecast.io/forecast/7bdce437a50fe9c10285065387a96c3c/", loc:CLLocationCoordinate2DMake(40.8561, -73.1165))
        appTheme = AppThemeData()
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var weatherIconLabel: UILabel!
    
    @IBOutlet weak var bgImage: UIImageView!
    
    
    @IBOutlet var homeView: UIView!
    
    var weather: NSURLRequest?
    var apiConnection: NSURLConnection?
    var weatherData: NSMutableData
    var currentLocation: CLLocation!
    var locManager: CLLocationManager
    var location: CLLocation?
    var apiData: ApiData
    var urlString: String!
    var url: NSURL!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        locManager.requestWhenInUseAuthorization()
        println(CLLocationManager.authorizationStatus().hashValue)
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways){
                location = locManager.location
        }
        self.urlString = apiData.apiUrlPath + apiData.loc.latitude.description + "," + apiData.loc.longitude.description
        self.url = NSURL(string: self.urlString)
        self.weather = NSURLRequest(URL: self.url)
        self.apiConnection = NSURLConnection(request: self.weather!, delegate: self, startImmediately: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        // Received a new request, clear out the data object
        self.weatherData = NSMutableData()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        // Append the received chunk of data to our data object
        self.weatherData.appendData(data)
    }
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        // Request complete, self.data should now hold the resulting info
        // Convert the retrieved data in to an object through JSON deserialization
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(weatherData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary

        var results: NSDictionary = jsonResult["currently"] as NSDictionary
        if jsonResult.count>0 && results.count>0 {
            weatherIconLabel.text = results["summary"] as String
            var key = results["icon"] as String
            if let theme = AppThemes[key] as AppThemeData!{
                appTheme = theme
            }
            appTheme.changeLabelsInViewToTheme(self.homeView)
            homeView.backgroundColor = appTheme.backgroundColor;
            bgImage.image = UIImage(named: appTheme.imagePath)
        }
    }
}