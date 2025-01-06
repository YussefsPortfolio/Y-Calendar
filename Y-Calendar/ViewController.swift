//
//  ViewController.swift
//  Y-Calendar
//
//  Created by Yussef Arsalan on 02.01.25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    

    // important labels + current date
    var cudate: Date = Date()
    var monthlabel: UILabel!
    var lebutton: UIButton!
    var ributton: UIButton!
    var Kasten: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Active Display of UI Elements
        setupUI()
        currentMonthLabel()
        print("funktioniert...")
        displayDays()
    }
        
    
    func setupUI(){
        
        // Label for month and year in the middle
        monthlabel = UILabel()
        monthlabel.frame = CGRect(x: view.frame.size.width / 2 - 100,y : 50,
                                  width : 200, height: 30)
        monthlabel.textAlignment = .center
        view.addSubview(monthlabel)
        monthlabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
       
        
        // Rectangle in Backgrund (No Use besides UI)
        let rectImageView = UIImageView(image: UIImage(systemName: "rectangle.fill"))
        rectImageView.frame = CGRect(x: view.frame.size.width / 2 - 240
                                     , y: 110, width: 480, height: 300)
        view.addSubview(rectImageView)
        rectImageView.tintColor = Cinerous
        
        
        // right button for going a month forward
        ributton = UIButton();
        ributton.frame = CGRect(x: view.frame.size.width / 2 + 160, y: 50,
                                   width: 40, height: 30)
        ributton.setImage(UIImage(systemName: "arrowshape.right.fill"), for : .normal)
        ributton.addTarget(self, action: #selector(NextMonth), for : .touchUpInside)
        view.addSubview(ributton)
        ributton.tintColor = RedWood
        
    
        
        
        // left button for going a month back
        lebutton = UIButton();
        lebutton.frame = CGRect(x: view.frame.size.width / 2 - 200, y: 50,
                                width: 40, height: 30)
        lebutton.setImage(UIImage(systemName: "arrowshape.left.fill"), for : .normal)
        lebutton.addTarget(self, action: #selector(PrevMonth), for: .touchUpInside)
        view.addSubview(lebutton)
        lebutton.tintColor = RedWood
        }
    
    
        // current month
            func currentMonthLabel() {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM yyyy"
            monthlabel.text = formatter.string(from: cudate)
            }
    
    
        // function to go a month forwards
            @objc func PrevMonth(){
            let cal = Calendar.current
            cudate = cal.date(byAdding: .month, value : -1, to :cudate)!
            currentMonthLabel()
                displayDays()
            }
    
    
        // function to go a month back
            @objc func NextMonth(){
            let cal = Calendar.current
            cudate = cal.date(byAdding: .month, value: 1, to: cudate)!
            currentMonthLabel()
                displayDays()
            }
    
    
            func daysInCurrentMonth() -> Int {
            let calendar = Calendar.current
            if let range = calendar.range(of: .day, in: .month, for: cudate) {
            return range.count}
            return 0
            
    }
    
        // Dont change for now will update later on 
            func displayDays() {
            view.subviews.filter { $0.tag == 100 }.forEach { $0.removeFromSuperview() }
        
                
            let days = daysInCurrentMonth()
            let startX: CGFloat = 17
            let startY: CGFloat = 140
            let buttonWidth: CGFloat = 44
            let buttonHeight: CGFloat = 40
            let spacing: CGFloat = 10
        
                
            for day in 1...days {
            let row = (day - 1) / 7
            let column = (day - 1) % 7
            
            let button = UIButton()
            button.frame = CGRect(
                x: startX + CGFloat(column) * (buttonWidth + spacing),
                y: startY + CGFloat(row) * (buttonHeight + spacing),
                width: buttonWidth,
                height: buttonHeight
            )
            button.setTitle("\(day)", for: .normal)
                button.backgroundColor = Silver
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.tag = 100
            view.addSubview(button)
        }
                
                
                
                // Add Colors here !! to keep code clean
    }
    let CaputMortuum    = UIColor(hex: "#5A2A27")
    let RedWood         = UIColor(hex: "#8D5B4C")
    let Liver           = UIColor(hex: "#5C4742")
    let Cinerous        = UIColor(hex: "#A5978B")
    let Silver          = UIColor(hex: "#C4BBAF")


}
