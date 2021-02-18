//
//  SurveyPage1ViewController.swift
//  FindFragrance
//
//  Created by Nayna on 8/6/20.
//  Copyright © 2020 Nayna. All rights reserved.
//

import UIKit
import Foundation

class SurveyPage1ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
   

    @IBOutlet weak var Rbtn_male: UIButton!
    
    @IBOutlet weak var Rbtn_female: UIButton!
    
    @IBOutlet weak var Rbtn_other: UIButton!
    
    @IBOutlet weak var txt_gender: UITextField!
    
    @IBOutlet weak var txt_ageGroup: UITextField!
   
    @IBOutlet weak var txt_smellType: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    var genderPicker = UIPickerView()
    var ageGroupPicker = UIPickerView()
    var smellTypePicker = UIPickerView()
 
      
    var gender = ["Male", "Female", "Unisex"]
       var genderChosen : String = ""
  
        var ageGroup = ["5-12 years", "12-18 years", "18-25 years", "25-32 years","32-50 years","other"]
          var ageChosen : String = ""
    
    var smellType = ["Woody", "Citrus", "Floral","Fruity","Musky", "Aquatic"]
        var smellTypeChosen : String = ""
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pastal4")!)
        genderPicker.dataSource = self
        genderPicker.delegate = self
        txt_gender.inputView = genderPicker
        
        ageGroupPicker.dataSource = self
        ageGroupPicker.delegate = self
        txt_ageGroup.inputView = ageGroupPicker
            
        smellTypePicker.dataSource = self
        smellTypePicker.delegate = self
        txt_smellType.inputView = smellTypePicker
        
     
               
        genderPicker.tag = 1
        ageGroupPicker.tag = 2
        smellTypePicker.tag=3
        
        // Do any additional setup after loading the view.
    }
    

   func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 1:
            return gender.count
        case 2:
            return ageGroup.count
        case 3:
            return smellType.count
          
            
        default:
            return 1
        }
        
        
     
    }
    
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        switch pickerView.tag {
              case 1:
                  return gender[row]
              case 2:
                  return ageGroup[row]
            case 3:
                  return smellType[row]
           
            
                  
              default:
                  return "data not found"
              }
        
      
    }

        func pickerView( pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          
        switch pickerView.tag {
                    case 1:
                       txt_gender.text = gender[row]
                        genderChosen = gender[row]
                       self.view.endEditing(true)
             //txt_gender.resignFirstResponder()
                    case 2:
                       txt_ageGroup.text = ageGroup[row]
                       ageChosen = ageGroup[row]
                       self.view.endEditing(true)
                  //      txt_ageGroup.resignFirstResponder()
                    case 3:
                        txt_smellType.text = smellType[row]
                        smellTypeChosen = smellType[row]
                        self.view.endEditing(true)
                                     //      txt_ageGroup.resignFirstResponder()
        
                    default:
                        return
                    }
              
            
          
        }
    
 
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
            switch pickerView.tag {
                             case 1:
                                txt_gender.text = gender[row]
                                genderChosen = gender[row]
                                txt_gender.resignFirstResponder()
                             case 2:
                                txt_ageGroup.text = ageGroup[row]
                                ageChosen = ageGroup[row]
                                txt_ageGroup.resignFirstResponder()
                            case 3:
                                 txt_smellType.text = smellType[row]
                                 smellTypeChosen = smellType[row]
                                 txt_smellType.resignFirstResponder()
                         
                             default:
                                 return
            
            
         
    }
            
    
}

    public func PredictPrf(){
                   let model = Perfumes()
                   
                   do{
                     let prediction = try
                           model.prediction(date: Double(2018), rating_score: Double(3), votes: Double(3), longevity_poor: Double(0), longevity_weak: Double(0), longevity_moderate: Double(0), longevity_long: Double(0), longevity_very_long: Double(0), sillage_soft: Double(0), sillage_moderate: Double(0), sillage_heavy: Double(0), sillage_enormous: Double(0), clslove: Double(1), clslike: Double(1), clsdislike: Double(1), clswinter: Double(1), clsspring: Double(1), clssummer: Double(1), clsautumn: Double(1), clscold: Double(0), clshot: Double(1), clsday: Double(1), clsnight: Double(1), clslove_female25under: Double(1), clslove_male25under: Double(1), clslove_female25older: Double(1), clslove_male25older: Double(1), clslike_female25under: Double(1), clslike_male25under: Double(1), clslike_female25older: Double(1), clslike_male25older: Double(1), clsdislike_female25under: Double(1), clsdislike_male25under: Double(1), clsdislike_female25older: Double(1), clsdislike_male25older: Double(1), clswinter_female25under: Double(1), clswinter_male25under: Double(1), clswinter_female25older: Double(1), clswinter_male25older: Double(1), clsspring_female25under: Double(1), clsspring_male25under: Double(1), clsspring_female25older: Double(1), clsspring_male25older: Double(1), clssummer_female25under: Double(1), clssummer_male25under: Double(1), clssummer_female25older: Double(1), clssummer_male25older: Double(1), clsautumn_female25under: Double(1), clsautumn_male25under: Double(1), clsautumn_female25older: Double(1), clsautumn_male25older: Double(1), clsday_female25under: Double(1), clsday_male25under: Double(1), clsday_female25older: Double(1), clsday_male25older: Double(1), clsnight_female25under: Double(1), clsnight_male25under: Double(1), clsnight_female25older: Double(1), clsnight_male25older: Double(1), Ihaveit: Double(0), Ihadit: Double(0), Iwantit: Double(0), gender: Double(0), a: Double(1), b: Double(0), c: Double(0), d: Double(0), e: Double(0))
                    
                    print(prediction.index)
                   }
                   catch{
                       
                   }
                   
               }
    
    @IBAction func submit(_ sender: Any) {
        let gender = genderChosen
        let age = ageChosen
        let smell =  smellTypeChosen
        
        var gendernum = 0
        var smellnum = 0
        
        if(gender == "Male")
        {
            gendernum = 2
        }
        else if(gender == "Female")
        {
            gendernum = 1
        }
        else{
            gendernum = 3
        }
        
        
        if(smell == "Woody")
        {
            smellnum = 0
        }
               else if(smell == "Citrus")
               {
                   smellnum = 11
               }
            else if(smell == "Floral")
            {
                smellnum = 2
            }
            else if(smell == "Fruity")
            {
                smellnum = 9
            }
            else if(smell == "Musky")
            {
                smellnum = 4
            }
               else{
                   smellnum = 15
               }
        
        
        do{
            
        let predictions = try Perfumes().prediction(date: Double(2018), rating_score: Double(3), votes: Double(3), longevity_poor: Double(0), longevity_weak: Double(0), longevity_moderate: Double(0), longevity_long: Double(0), longevity_very_long: Double(0), sillage_soft: Double(0), sillage_moderate: Double(0), sillage_heavy: Double(0), sillage_enormous: Double(0), clslove: Double(1), clslike: Double(1), clsdislike: Double(1), clswinter: Double(1), clsspring: Double(1), clssummer: Double(1), clsautumn: Double(1), clscold: Double(0), clshot: Double(1), clsday: Double(1), clsnight: Double(1), clslove_female25under: Double(1), clslove_male25under: Double(1), clslove_female25older: Double(1), clslove_male25older: Double(1), clslike_female25under: Double(1), clslike_male25under: Double(1), clslike_female25older: Double(1), clslike_male25older: Double(1), clsdislike_female25under: Double(1), clsdislike_male25under: Double(1), clsdislike_female25older: Double(1), clsdislike_male25older: Double(1), clswinter_female25under: Double(1), clswinter_male25under: Double(1), clswinter_female25older: Double(1), clswinter_male25older: Double(1), clsspring_female25under: Double(1), clsspring_male25under: Double(1), clsspring_female25older: Double(1), clsspring_male25older: Double(1), clssummer_female25under: Double(1), clssummer_male25under: Double(1), clssummer_female25older: Double(1), clssummer_male25older: Double(1), clsautumn_female25under: Double(1), clsautumn_male25under: Double(1), clsautumn_female25older: Double(1), clsautumn_male25older: Double(1), clsday_female25under: Double(1), clsday_male25under: Double(1), clsday_female25older: Double(1), clsday_male25older: Double(1), clsnight_female25under: Double(1), clsnight_male25under: Double(1), clsnight_female25older: Double(1), clsnight_male25older: Double(1), Ihaveit: Double(0), Ihadit: Double(0), Iwantit: Double(0), gender: Double(gendernum), a: Double(smellnum), b: Double(0), c: Double(0), d: Double(0), e: Double(0))
            
            result.text = "Perfume ID: " + String(Int(predictions.index))
        }
        catch {
                   print("Error")
               }
        
    }
    
    
    
}
