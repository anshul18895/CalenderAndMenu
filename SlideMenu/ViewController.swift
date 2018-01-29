//
//  ViewController.swift
//  SlideMenu
//
//  Created by MAC238 on 1/29/18.
//  Copyright © 2018 Anshul Shah. All rights reserved.
//

import UIKit
class ViewController: UIViewController,WWCalendarTimeSelectorProtocol {
    
    fileprivate var singleDate: Date = Date()
    fileprivate var multipleDates: [Date] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickToggle(sender: UIButton){
        self.slideMenuController()?.toggleRight()
    }
    @IBAction func onClickOpenCalender(_ sender: Any) {
        let selector = UIStoryboard(name: "WWCalendarTimeSelector", bundle: nil).instantiateInitialViewController() as! WWCalendarTimeSelector
        selector.delegate = self
        selector.optionCurrentDate = singleDate
        selector.optionCurrentDates = Set(multipleDates)
        selector.optionCurrentDateRange.setStartDate(multipleDates.first ?? singleDate)
        selector.optionCurrentDateRange.setEndDate(multipleDates.last ?? singleDate)
        selector.optionSelectionType = WWCalendarTimeSelectorSelection.range
        self.navigationController?.pushViewController(selector, animated: true)
        //self.present(selector, animated: true, completion: nil)
    }
    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, date: Date) {
        print("Selected \n\(date)\n---")
        singleDate = date
    }
    
    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, dates: [Date]) {
        //print("Selected Multiple Dates \n\(dates)\n---")
        let dateFormattor = DateFormatter()
        dateFormattor.dateFormat = "dd - MM - yyyy"
        dateFormattor.timeZone = TimeZone.current
        print(dateFormattor.string(from: dates.first!))
        print(dateFormattor.string(from: dates.last!))
        
        
        
        //
    }
    func WWCalendarTimeSelectorDidDismiss(_ selector: WWCalendarTimeSelector) {
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
}

class BlueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
class RedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
