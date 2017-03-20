//
//  FeedListFRC.swift
//  PocketRocketNews
//
//  Created by Алексей on 20.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import CoreData


extension FeedListViewController: NSFetchedResultsControllerDelegate {
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, `for` type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath{
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
            break
            
        case .delete:
            
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case .update:
            if let indexPath = indexPath{
                if let cell = tableView.cellForRow(at: indexPath) as? FeedListCell{
                    configure(cell, at: indexPath)
                }
            }
            break
            
        case .move:
            if let indexPath = indexPath{
                if let newIndexPath = newIndexPath{
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    tableView.insertRows(at: [newIndexPath], with: .fade)
                }
            }
            break
            
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, `for` type: NSFetchedResultsChangeType) {
        
        switch type {
        case .insert:
            
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
            break
            
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
            break
            
        default:
            break
            
        }
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, sectionIndexTitleForSectionName sectionName: String) -> String? {
        return nil
    }
}
