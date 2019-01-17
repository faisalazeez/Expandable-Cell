//
//  ContactDataSource.swift
//  ExpandableCells
//
//  Created by Faisal Azeez on 17.01.2019.
//  Copyright © 2019 Faisal Azeez. All rights reserved.
//

import UIKit

final class DataSource: NSObject, UITableViewDataSource {
    private let cellIdentifier = "ScheduleCell"
    
    fileprivate var items: [ScheduleModel] = [ScheduleModel(name:"Schedule 1",turnOnStatus:ScheduleModel.SwitchStatus(time:"",Selected:false),turnOFFStatus:ScheduleModel.SwitchStatus(time:"",Selected:false),schedule:ScheduleModel.Schedules.only, selectedDate: ["M","T"]),ScheduleModel(name:"Schedule 2",turnOnStatus:ScheduleModel.SwitchStatus(time:"",Selected:false),turnOFFStatus:ScheduleModel.SwitchStatus(time:"",Selected:false),schedule:ScheduleModel.Schedules.only, selectedDate: ["M","T"]),ScheduleModel(name:"Schedule 3",turnOnStatus:ScheduleModel.SwitchStatus(time:"",Selected:false),turnOFFStatus:ScheduleModel.SwitchStatus(time:"",Selected:false),schedule:ScheduleModel.Schedules.only, selectedDate: ["M","T"])]
    
    fileprivate var indexPaths: Set<IndexPath> = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ScheduleCell
        
        let programmingLanguageName = self[indexPath].name
        let description = "description"
//        let icon = self[indexPath].icon
        
        cell.update(name: programmingLanguageName,
            description: description
        )

        cell.state = cellIsExpanded(at: indexPath) ? .expanded : .collapsed
    
        return cell
    }
}

extension DataSource {
    func cellIsExpanded(at indexPath: IndexPath) -> Bool {
        return indexPaths.contains(indexPath)
    }
    
    func addExpandedIndexPath(_ indexPath: IndexPath) {
        indexPaths.insert(indexPath)
    }
    
    func removeExpandedIndexPath(_ indexPath: IndexPath) {
        indexPaths.remove(indexPath)
    }
}

extension DataSource {
    subscript(indexPath: IndexPath) -> ScheduleModel {
        return items[indexPath.row]
    }
}
