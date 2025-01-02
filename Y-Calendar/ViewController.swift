//
//  ViewController.swift
//  Y-Calendar
//
//  Created by Yussef Arsalan on 02.01.25.
//

import UIKit

class ViewController: UIViewController {

    // important labels + current date
    var cudate: Date = Date()
    var monthlabel: UILabel!
    var lebutton: UIButton!
    var ributton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI elements
        setupUI()
        currentMonthLabel()
        print("funktioniert...")
        
    }
        
    
    func setupUI(){
        // Label for month and year
        monthlabel = UILabel()
        monthlabel.frame = CGRect(x: view.frame.size.width / 2 - 100,y : 100,
                                  width : 200, height: 50)
        monthlabel.textAlignment = .center
        view.addSubview(monthlabel)
        
        
        
        // right button for going a month forward
        ributton = UIButton();
        ributton.frame = CGRect(x: view.frame.size.width / 2 + 160, y: 100,
                                   width: 40, height: 50)
        ributton.setImage(UIImage(systemName: "arrowshape.right.fill"), for : .normal)
        ributton.tintColor = .orange
        ributton.addTarget(self, action: #selector(NextMonth), for : .touchUpInside)
        view.addSubview(ributton)
        
        
        
        // left button for going a month back
        lebutton = UIButton();
        lebutton.frame = CGRect(x: view.frame.size.width / 2 - 200, y: 100,
                                width: 40, height: 50)
        lebutton.setImage(UIImage(systemName: "arrowshape.left.fill"), for : .normal)
        lebutton.tintColor = .orange
        lebutton.addTarget(self, action: #selector(PrevMonth), for: .touchUpInside)
        view.addSubview(lebutton)
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
            }
    
    
        // function to go a month back
            @objc func NextMonth(){
            let cal = Calendar.current
            cudate = cal.date(byAdding: .month, value: 1, to: cudate)!
            currentMonthLabel()
            }
}
