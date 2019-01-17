//
//  Contact.swift
//  ExpandableCells
//
//  Created by Faisal Azeez on 17.01.2019.
//  Copyright © 2019 Faisal Azeez. All rights reserved.
//

import UIKit

struct ScheduleModel{
    
    struct SwitchStatus{
        let time: String
        let Selected : Bool
    }
    
    enum Schedules {
        case only
        case repeatDialy
        case custom
    }
    
    let name: String
    var turnOnStatus : SwitchStatus
    var turnOFFStatus : SwitchStatus
    var schedule : Schedules
    var selectedDate : [String]?

}
