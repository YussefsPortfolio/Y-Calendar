//
//  DataHandling.swift
//  Y-Calendar
//
//  Created by Yussef Arsalan on 04.03.25.
//

import CoreData
import UIKit

class DataHandling {
    
    static let shared = DataHandling()
    
    private init() {}
    
    // Methode for saving event
    func saveEvent(title: String, date: Date, description: String?, location: String?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let event = Event(context: context)
        event.title = title
        event.date = date
        event.eventDescription = description
        event.location = location
        
        do {
            try context.save()
        } catch {
            print("Fehler beim Speichern des Ereignisses: \(error)")
        }
    }
    
    // Methode zum Abrufen of every Ereignisse
    func fetchEvents() -> [Event]? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        
        do {
            let events = try context.fetch(fetchRequest)
            return events
        } catch {
            print("Fehler beim Abrufen der Ereignisse: \(error)")
            return nil
        }
    }
    
    //  Method for calling events
    func fetchEvents(forMonth month: Date) -> [Event]? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        
        // Filter for the month
        let calendar = Calendar.current
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        let endOfMonth = calendar.date(byAdding: .month, value: 1, to: startOfMonth)!
        
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date < %@", startOfMonth as NSDate, endOfMonth as NSDate)
        
        do {
            let events = try context.fetch(fetchRequest)
            return events
        } catch {
            print("Fehler beim Abrufen der Ereignisse für den Monat: \(error)")
            return nil
        }
    }
}
