//
//  StudyViewController.swift
//  PlanoDeEstudos
//
//  Created by Jonathan Gomes on 14/03/2019.
//  Copyright © 2019 Jonathan Gomes All rights reserved.

import UIKit
import UserNotifications

class StudyPlanViewController: UIViewController {

    @IBOutlet weak var tfCourse: UITextField!
    @IBOutlet weak var tfSection: UITextField!
    @IBOutlet weak var dpDate: UIDatePicker!
    
    let sm = StudyManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dpDate.minimumDate = Date()
    }
    
    @IBAction func schedule(_ sender: UIButton) {
        let id = String(Date().timeIntervalSince1970)
        let studyPlan = StudyPlan(course: tfCourse.text!, section: tfSection.text!, date: dpDate.date, done: false, id: id)
        
        addNotification(studyPlan, id)
        
        sm.addPlan(studyPlan)
        navigationController!.popViewController(animated: true)
    }
    
    
    fileprivate func addNotification(_ studyPlan: StudyPlan, _ id: String) {
        let content = UNMutableNotificationContent()
        content.title = "Lembrete"
        content.subtitle = "Matéria: \(studyPlan.course)"
        content.body = "Estudar \(studyPlan.section)"
        content.categoryIdentifier = "Lembrete"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: studyPlan.date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats:  false)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
