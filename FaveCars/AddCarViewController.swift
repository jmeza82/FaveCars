//
//  AddCarViewController.swift
//  FaveCars
//
//  Created by Juan Meza on 12/26/17.
//  Copyright © 2017 Tech-IN. All rights reserved.
//

import UIKit

class AddCarViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var carImgView: UIImageView!
    @IBOutlet weak var selectCarButton: UIButton!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    let photoPicker = UIImagePickerController()
    
    var imagePicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ADD NEW CAR"
        
        nameTextField.delegate = self
        nameTextField.layer.cornerRadius = 10
        
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        
        selectCarButton.layer.cornerRadius = 10
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        nameTextField.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let lenght = nameTextField.text?.count {
            
            characterCountLabel.text = "\(lenght + 1) characters so far"
            //print(lenght + 1)
        }
        
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            imagePicked = true
            carImgView.image = selectedImage
            //imagesArray.append(selectedImage)
            imagesArray.insert(selectedImage, at: 0)
            
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func selectCar(_ sender: Any) {
        
        present(photoPicker, animated: true)
        
    }
    

    @IBAction func save(_ sender: Any) {
        
        if !imagePicked {
            
            print("There is no image")
            return
            
        }
        
        if (nameTextField.text?.isEmpty)!  {
            
            print("Text empty")
            return
        }
        
        print("Code after return")
        if let value = nameTextField.text {
            
            //namesArray.append(value)
            namesArray.insert(value, at: 0)
            
            if let navController = navigationController {
                
                navController.popViewController(animated: true)
            }
        }
        
        
    }
}
