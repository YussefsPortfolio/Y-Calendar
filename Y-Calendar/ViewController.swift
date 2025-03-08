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
    
        
    
// Active Display of UI Elements
    override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    currentMonthLabel()
    displayDays()
    goToToday()
    print("funktioniert...")}
    
    
func setupUI() {
    view.backgroundColor = .white // Backgroundcolor
        
    
// Top Rectangle in Background (No Use beside UI)
    let rectImageView1 = UIImageView(image: UIImage(systemName: "rectangle.fill"))
    rectImageView1.tintColor = Black
    view.addSubview(rectImageView1)
    rectImageView1.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    rectImageView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    rectImageView1.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -1000),
    rectImageView1.widthAnchor.constraint(equalToConstant: 800),
    rectImageView1.heightAnchor.constraint(equalToConstant: 1600)])
        
    
// Label for month and year in the middle
    monthlabel = UILabel()
    monthlabel.textAlignment = .center
    monthlabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    view.addSubview(monthlabel)
    monthlabel.translatesAutoresizingMaskIntoConstraints = false
    monthlabel.textColor = LightGrey
    NSLayoutConstraint.activate([
    monthlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    monthlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)])

    
// Bottom Rectangle in Background (No Use besides UI)
    let rectImageView = UIImageView(image: UIImage(systemName: "rectangle.fill"))
    rectImageView.tintColor = Grey
    view.addSubview(rectImageView)
    rectImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    rectImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    rectImageView.topAnchor.constraint(equalTo: monthlabel.bottomAnchor, constant: 635),
    rectImageView.widthAnchor.constraint(equalToConstant: 800),
    rectImageView.heightAnchor.constraint(equalToConstant: 1200)])

    
// Rectangle around Label, will update if I know how to combine label with UI into one Button (wont happen)
    let ButtonLabel1 = UIImageView(image: UIImage(systemName: "rectangle.fill"))
    ButtonLabel1.tintColor = Grey
    view.addSubview(ButtonLabel1)
    ButtonLabel1.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    ButtonLabel1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ButtonLabel1.topAnchor.constraint(equalTo: monthlabel.bottomAnchor, constant: 720),
    ButtonLabel1.widthAnchor.constraint(equalToConstant: 100),
    ButtonLabel1.heightAnchor.constraint(equalToConstant: 45)])
    
    
// Label for button Text (today)
    let todayButton = UIButton()
    todayButton.setTitle("Today", for: .normal)
    todayButton.setTitleColor(Carmine, for: .normal)
    todayButton.addTarget(self, action: #selector(goToToday), for: .touchUpInside)
    view.addSubview(todayButton)
    todayButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    todayButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    todayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    todayButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 763)])
    
    
    let addButton = UIButton(type: .system)
    addButton.setTitle("+", for: .normal)
    addButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    addButton.setTitleColor(Carmine, for: .normal)
    addButton.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
    view.addSubview(addButton)
    addButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 31),
    addButton.widthAnchor.constraint(equalToConstant: 50),
    addButton.heightAnchor.constraint(equalToConstant: 50)])

        
// Left button for going a month back
        lebutton = UIButton()
        lebutton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        lebutton.addTarget(self, action: #selector(PrevMonth), for: .touchUpInside)
        lebutton.tintColor = Carmine
        view.addSubview(lebutton)
        lebutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        lebutton.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        lebutton.centerYAnchor.constraint(equalTo: monthlabel.centerYAnchor),
        lebutton.widthAnchor.constraint(equalToConstant: 40),
        lebutton.heightAnchor.constraint(equalToConstant: 30)])
        
    
// Right button for going a month forward
        ributton = UIButton()
        ributton.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        ributton.addTarget(self, action: #selector(NextMonth), for: .touchUpInside)
        ributton.tintColor = Carmine
        view.addSubview(ributton)
        ributton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ributton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ributton.centerYAnchor.constraint(equalTo: monthlabel.centerYAnchor),
        ributton.widthAnchor.constraint(equalToConstant: 40),
        ributton.heightAnchor.constraint(equalToConstant: 30)])
        
    
    }
    
    
    
    @objc func addEvent() {
    let addEventVC = AddEvent()
    addEventVC.selectedDate = cudate
    self.present(addEventVC, animated: true, completion: nil)}
    
// current month
    func currentMonthLabel() {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy"
    monthlabel.text = formatter.string(from: cudate)}
    
    
//function to go to the current day
    @objc func goToToday() {
    cudate = Date()
    currentMonthLabel()
    displayDays()}
    
    
// function to go a month forwards
    @objc func PrevMonth(){
    let cal = Calendar.current
    cudate = cal.date(byAdding: .month, value : -1, to :cudate)!
    currentMonthLabel()
    displayDays()}
    
    
// function to go a month back
    @objc func NextMonth(){
    let cal = Calendar.current
    cudate = cal.date(byAdding: .month, value: 1, to: cudate)!
    currentMonthLabel()
    displayDays()}
    
    
// function to
    func daysInCurrentMonth() -> Int {
    let calendar = Calendar.current
    if let range = calendar.range(of: .day, in: .month, for: cudate) {
    return range.count}
    return 0}
    
    
    // Dont change for now will update later on
    func displayDays() {
    for subview in view.subviews {
    if let stackView = subview as? UIStackView, stackView.axis == .vertical
    {stackView.removeFromSuperview()}   }
    let days = daysInCurrentMonth()
    let calendar = Calendar.current
    let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: cudate))!
    let startingWeekday = calendar.component(.weekday, from: firstDayOfMonth)
   
        
    // Erstelle einen StackView für die Tage
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    view.addSubview(stackView)
        
        
        // AutoLayout constraints for stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: monthlabel.bottomAnchor, constant: 60),
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        stackView.heightAnchor.constraint(equalToConstant: 500)])
        
        
        // Weekdays above the Date-Columns
        let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        let weekdayRow = UIStackView()
        weekdayRow.axis = .horizontal
        weekdayRow.distribution = .fillEqually
        weekdayRow.spacing = 10
        stackView.addArrangedSubview(weekdayRow)
        for day in weekdays {
        let label = UILabel()
        label.text = day
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = LightGrey
        weekdayRow.addArrangedSubview(label)}
        
        
        
        // Adds the days of the month
        var dayCounter = 1
        for row in 0..<6 {
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.distribution = .fillEqually
        rowStackView.spacing = 10
            
        
            // Dont change, will mess up whole day-arrangement
            for column in 0..<7 {
                if (row == 0 && column < (startingWeekday + 5) % 7) || dayCounter > days {
                    let emptyView = UIView()
                    rowStackView.addArrangedSubview(emptyView)
                } else {
                    let button = UIButton()
                    button.setTitle("\(dayCounter)", for: .normal)
                    button.backgroundColor = Grey
                    button.setTitleColor(.black, for: .normal)
                    button.layer.cornerRadius = 5
                    button.tag = 100
                    rowStackView.addArrangedSubview(button)
                    dayCounter += 1
                }
            }
            stackView.addArrangedSubview(rowStackView)
        }
    }
    
    
    // Add Colors here !! to keep code clean
    let CaputMortuum    = UIColor(hex: "#5A2A27")
    let RedWood         = UIColor(hex: "#8D5B4C")
    let Liver           = UIColor(hex: "#5C4742")
    let Cinerous        = UIColor(hex: "#A5978B")
    let Silver          = UIColor(hex: "#C4BBAF")
    
    let RichBlack       = UIColor(hex: "#0E141B")
    let Carmine         = UIColor(hex: "#931621")
    let ResedaGreen     = UIColor(hex: "#71816D")
    let Almond          = UIColor(hex: "#FFFFFF")
    let RaisinBlack     = UIColor(hex: "#1E1E24")
    
    let Night           = UIColor(hex: "#0A090C")
    let Gray            = UIColor(hex: "#7C7C7C")
    let EerieBlack      = UIColor(hex: "#1C1D21")
    let BabyPowder      = UIColor(hex: "#FDFFFC")
    let ColumbiaBlue    = UIColor(hex: "#CCE6F4")
    
    let Licorice        = UIColor(hex: "#251C18")
    let AirBlue         = UIColor(hex: "#759FBC")
    let RoseQuartz      = UIColor(hex: "#27232F")
    let Jet             = UIColor(hex: "#6A6A6A")
    let Black           = UIColor(hex: "#202124")
    
    let Grey            = UIColor(hex: "#9AA0A6")
    let LightGrey       = UIColor(hex: "#F1F3F4")
    let LightBlue       = UIColor(hex: "#D2E3FC")
    let LightGreen      = UIColor(hex: "#CEEAD6")
}
