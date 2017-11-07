//
//  InternetCheckViewController.swift
//  gbprates4you
//
//  Created by Wasilij on 04/09/2017.
//  Copyright © 2017 Wasilij. All rights reserved.
//

import UIKit

class InternetCheckViewController: UIViewController, UITextViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
   
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textForError: UITextView!
    @IBOutlet weak var buttonToTryAgain: UIButton!
    let defaults:UserDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        checkWeatherDataExists()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickAction(_ sender: Any) {
        
        
    }
    @IBAction func reloadAction(_ sender: Any) {
        
        checkWeatherDataExists()

    }
    
    func assignbackground(){
    
        let background = UIImage(named: "image")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }

    func checkWeatherDataExists()
    {
        indicator.color = UIColor.black
        indicator.backgroundColor = UIColor.clear
        indicator.startAnimating()
        labelText.isHidden = false
        textForError.isHidden = true
        buttonToTryAgain.isHidden = true
        let conn = NetworkManagerRo()
        conn.getjson(){teta in
            if(teta)
            {
                self.goToAnotherStoryBoard()
            }else{
                self.stopAndShowButton()
            }
        }
    }
    
    func stopAndShowButton()
    {
        indicator.stopAnimating()
        labelText.isHidden = true
        textForError.isHidden = false
        buttonToTryAgain.tintColor = UIColor.white
        buttonToTryAgain.isHidden = false
    }
    
    func goToAnotherStoryBoard()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ID") as UIViewController
        present(vc, animated: true, completion: nil)
    }
}
