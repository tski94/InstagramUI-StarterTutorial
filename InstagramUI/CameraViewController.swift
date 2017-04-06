//
//  CameraViewController.swift
//  InstagramUI
//
//  Created by Ivor D. Addo on 4/6/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import Firebase
import MobileCoreServices

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var takePictureButton: UIButton!
    @IBOutlet weak var choosePictureButton: UIButton!
    @IBOutlet weak var savePicButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func takePictureButtonPressed(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.sourceType = .camera
            imgPicker.allowsEditing = false
            
            self.present(imgPicker, animated: true, completion: nil)
            
        }
    }
 
    @IBAction func choosePictureButtonPressed(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.sourceType = .photoLibrary
            imgPicker.allowsEditing = false
            
            self.present(imgPicker, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func savePictureButtonPressed(_ sender: UIBarButtonItem) {
        
        if previewImage != nil {
            let imageData = UIImageJPEGRepresentation(previewImage.image!, 0.6)
            let compressedJPEG = UIImage(data: imageData!)
            UIImageWriteToSavedPhotosAlbum(compressedJPEG!, nil, nil, nil)
            
            //Save to Firebase
            let uid = "qwerty"
            
            let ref = FIRDatabase.database().reference()
            let storage = FIRStorage.storage().reference(forURL: "gs://instagramui-tutorial.appspot.com/")
            let key = ref.child("Posts").childByAutoId()
            let imageref = storage.child("Posts").child(uid).child("\(key).jpg")
            
            
            let data = UIImageJPEGRepresentation(self.previewImage.image!, 0.6)
            
            _ = imageref.downloadURL(completion: { (url, error) in
                if let url = url {
                    let feed = ["userId": uid,
                                "pathtoimage": url.absoluteString
                    ] as [String: Any]
                    
                    let postFeed = ["\(key)" : feed]
                    
                    ref.child("Posts").updateChildValues(postFeed)
                    
                }
            })
            
            
        }
        print("Saved!")
        clearImage()
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imgImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            previewImage.image = imgImage
        } else {
            print("something went wrong!")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func clearImage() {
        previewImage.image = nil
    }
    


}
