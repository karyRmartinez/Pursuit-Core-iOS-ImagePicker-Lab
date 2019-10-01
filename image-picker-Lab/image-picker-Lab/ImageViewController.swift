//
//  ViewController.swift
//  image-picker-Lab
//
//  Created by Kary Martinez on 10/1/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var photoLibraryAccess = false
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    var image = UIImage() {
        didSet {
            profilePicture.image = image
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
       
    }
  
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        imagePickerViewController.sourceType = .photoLibrary
        
        present(imagePickerViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func addImageWhenPressed(_ sender: Any) {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        imagePickerViewController.sourceType = .photoLibrary
        
        if photoLibraryAccess {
            imagePickerViewController.delegate = self
            present(imagePickerViewController, animated: true, completion: nil)
        } else {
            let alertVC = UIAlertController(title: "No Access", message: "Camera access is required to use this app.", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction (title: "Deny", style: .destructive, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            
            alertVC.addAction(UIAlertAction (title: "I will let you in", style: .default, handler: { (action) in
                self.photoLibraryAccess = true
                self.present(imagePickerViewController, animated: true, completion: nil)
            }))
        }
    }
}
extension ImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            //couldn't get image :(
            return
        }
        self.image = image
        dismiss(animated: true, completion: nil)
    }
}


extension ImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let userName = textField.text {
        welcomeLabel.text = "Welcome, \(userName)"
        } else {
            welcomeLabel.text = "Welcome"
        }
        return true
    }
}
