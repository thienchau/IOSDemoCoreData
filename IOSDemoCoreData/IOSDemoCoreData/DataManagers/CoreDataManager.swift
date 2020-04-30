//
//  CoreDataManager.swift
//  IOSDemoCoreData
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    private var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getGarment(sortStrategy: SortStrategy) -> [Garment] {
        
        var garmentEntities = [GarmentEntity]()
        let garmentEntityRequest: NSFetchRequest<GarmentEntity> = GarmentEntity.fetchRequest();
        garmentEntityRequest.sortDescriptors = [sortStrategy.decriptor()]
        
        do {
            garmentEntities = try self.moc.fetch(garmentEntityRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return garmentEntities.map(Garment.init)
    }
    
    func saveGarment(garment: Garment) {
        let garmentEntity = GarmentEntity(context: self.moc)
        garmentEntity.garment = garment
        
        do {
            try self.moc.save()
        } catch {
            print(error)
        }
    }
    
    func deleteAll() {
        let deleteReq = NSBatchDeleteRequest(fetchRequest: GarmentEntity.fetchRequest())
        
        do {
            try self.moc.execute(deleteReq)
        }
        catch {
            print(error)
        }
    }
}
