//
//  BookViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit
struct Constants {
    
    struct FlickrURLParams {
        static let APIScheme = "https"
        static let APIHost = "api.flickr.com"
        static let APIPath = "/services/rest"
    }
}
struct FlickrAPIKeys {
    static let SearchMethod = "method"
    static let APIKey = "api_key"
    static let Extras = "extras"
    static let ResponseFormat = "format"
    static let DisableJSONCallback = "nojsoncallback"
    static let SafeSearch = "safe_search"
    static let Text = "text"
}

struct FlickrAPIValues {
    static let SearchMethod = "flickr.photos.search"
    static let APIKey = "101796e68db863912e66eebb072a223b"
    static let ResponseFormat = "json"
    static let DisableJSONCallback = "1"
    static let MediumURL = "url_m"
    static let SafeSearch = "1"
}

class BookViewController: UIViewController {
    
    
    // UI Elements
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var bookReleaseYear: UILabel!
    
    // Buttons
    @IBOutlet weak var summaryBtn: UIButton!
    @IBOutlet weak var startQuizBtn: UIButton!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    let sampleBook: Book = Book()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set data to book information
        navigationBar.title = sampleBook.title
        bookDescription.text = sampleBook.description
        bookReleaseYear.text = "\(sampleBook.releaseYear)"
        let searchText = sampleBook.title+" "+sampleBook.author
        
        
        let searchURL = flickrURLFromParameters(searchString: searchText)
        print("URL: \(searchURL)")
        
        // Send the request
        performFlickrSearch(searchURL)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func flickrURLFromParameters(searchString: String)->URL{
        
        // Build base URL
        var components = URLComponents()
        components.scheme = Constants.FlickrURLParams.APIScheme
        components.host = Constants.FlickrURLParams.APIHost
        components.path = Constants.FlickrURLParams.APIPath
        
        // Build query string
        components.queryItems = [URLQueryItem]()
        
        // Query components
        components.queryItems!.append(URLQueryItem(name: FlickrAPIKeys.APIKey, value: FlickrAPIValues.APIKey));
        components.queryItems!.append(URLQueryItem(name: FlickrAPIKeys.SearchMethod, value: FlickrAPIValues.SearchMethod));
        components.queryItems!.append(URLQueryItem(name: FlickrAPIKeys.ResponseFormat, value: FlickrAPIValues.ResponseFormat));
        components.queryItems!.append(URLQueryItem(name: FlickrAPIKeys.Extras, value: FlickrAPIValues.MediumURL));
        components.queryItems!.append(URLQueryItem(name: FlickrAPIKeys.SafeSearch, value: FlickrAPIValues.SafeSearch));
        components.queryItems!.append(URLQueryItem(name: FlickrAPIKeys.DisableJSONCallback, value: FlickrAPIValues.DisableJSONCallback));
        components.queryItems!.append(URLQueryItem(name: FlickrAPIKeys.Text, value: searchString));
        
        return (components.url)!
    }
    
    private func performFlickrSearch(_ searchURL: URL) {
        
        // Perform the request
        let session = URLSession.shared
        let request = URLRequest(url: searchURL)
        let task = session.dataTask(with: request){
            (data, response, error) in
            if (error == nil)
            {
                // Check response code
                let status = (response as! HTTPURLResponse).statusCode
                
                /* Check data returned? */
                guard let data = data else {
                    print("No data was returned by the request!")
                    return
                }
                
                // Parse the data
                let parsedResult: [String:AnyObject]!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
                } catch {
                    print("Could not parse the data as JSON: '\(data)'")
                    return
                }
                print("Result: \(parsedResult)")
                
                // Check for "photos" key in our result
                guard let photosDictionary = parsedResult["photos"] as? [String:AnyObject] else {
                    print("Key 'photos' not in \(parsedResult)")
                    return
                }
                print("Result: \(photosDictionary)")
                
                /* GUARD: Is the "photo" key in photosDictionary? */
                guard let photosArray = photosDictionary["photo"] as? [[String: AnyObject]] else {
                    print("Cannot find key 'photo' in \(photosDictionary)")
                    return
                }
                
                // Check number of photos
                if photosArray.count == 0 {
                    print("No Photos Found. Search Again.")
                    return
                } else {
                    // Get the first image
                    let photoDictionary = photosArray[0] as [String: AnyObject]
                    
                    /* GUARD: Does our photo have a key for 'url_m'? */
                    guard let imageUrlString = photoDictionary["url_m"] as? String else {
                        print("Cannot find key 'url_m' in \(photoDictionary)")
                        return
                    }
                    
                    // Fetch the image
                    self.fetchImage(imageUrlString);
                }
            }
            else{
                print((error?.localizedDescription)!)
            }
        }
        task.resume()
    }
    private func fetchImage(_ url: String) {
        
        let imageURL = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
            if error == nil {
                let downloadImage = UIImage(data: data!)!
                
                DispatchQueue.main.async() {
                    self.sampleBook.coverImage = downloadImage
                    self.coverImage.image = self.sampleBook.coverImage
                    
                    
                    
                }
                
            }
        }
        
        task.resume()
    }
    
    
    
    
    
    
    
    
    
}





