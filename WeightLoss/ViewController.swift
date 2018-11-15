//
//  ViewController.swift
//  WeightLoss
//
//  Created by Dhriti Chawla on 1/1/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var pounds: UITextField!
    @IBOutlet weak var days: UITextField!
    @IBOutlet weak var Activity: UIPickerView!
    
    var pickerData:  [String] = [String] ()
    var calGoal: Double = 0.0
    var value: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.Activity.delegate = self
        self.Activity.dataSource = self
        pickerData = ["almost not at all", "1-3 days", "3-4 days", "5-7 days", "every day intensive workout"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         value = row
        print (value)
         return pickerData[row]
        
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateCalories(_ sender: Any) {
   
        let pickerValues =  [1.2, 1.325, 1.55, 1.725, 1.9]
        let w = Double(weight.text!) ?? 0
        let h = Double(height.text!)!  * 0.393701
        let a = Double(age.text!) ?? 0
        let p = Double (pounds.text!) ?? 0
        let d = Double (days.text!) ?? 1
        
        
        if (gender.selectedSegmentIndex == 0) {
            let bmr = 66 + (6.23 * w) + (12.7 * h) - (6.8 * a)
            let tdee = bmr * pickerValues[value]
            let less = (3500 * p) / d
            let val = tdee - less
            let final = val / tdee
        
            calGoal = tdee * final
            
            if (calGoal < 0) {
                print ("Error")
                calories.text = String("Error")
            } else if Int(days.text!) != 1 {
                calories.text = String(format:"%.2f", calGoal)
            }
            
        }
        
        else {
            
            let bmr = 655 + (4.35 * w) + (4.7 * h) - (4.7 * a)
            let tdee = bmr * pickerValues[value]
            let less = (3500 * p) / d
            let val = tdee - less
            let final = val / tdee
            
            calGoal = tdee * final
            
            if (calGoal < 0) {
                calories.text = String("Error")
            } else if Int(days.text!) != 1 {
                calories.text = String(format:"%.2f", calGoal)
            }
            
        }
        
    }
    
}
