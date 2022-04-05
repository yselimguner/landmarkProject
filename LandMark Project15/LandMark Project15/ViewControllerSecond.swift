//
//  ViewControllerSecond.swift
//  LandMark Project15
//
//  Created by Yavuz Güner on 19.02.2022.
//

import UIKit

class ViewControllerSecond: UIViewController {

    @IBOutlet weak var landmarkPicture: UIImageView!
    @IBOutlet weak var LandmarkLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    var selectedLandmarkText=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LandmarkLabel.text = selectedLandmarkName
        landmarkPicture.image = selectedLandmarkImage
        textView.text = selectedLandmarkText
       
    }
    


}
