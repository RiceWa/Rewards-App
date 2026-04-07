//
//  Users+CoreDataProperties.swift
//  RewardsApp
//
//  Created by Daniel Perusse on 2026-04-07.
//
//

public import Foundation
public import CoreData


public typealias UsersCoreDataPropertiesSet = NSSet

extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var points: Int64

}

extension Users : Identifiable {

}
