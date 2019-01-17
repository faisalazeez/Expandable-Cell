//
//  ContactCell.swift
//  ExpandableCells
//
//  Created by Faisal Azeez on 17.01.2019.
//  Copyright © 2019 Faisal Azeez. All rights reserved.
//

import UIKit

final class ScheduleCell: UITableViewCell {
    enum CellState {
        case collapsed
        case expanded
        
        var carretImage: UIImage {
            switch self {
                case .collapsed:
                    return #imageLiteral(resourceName: "expand")
                case .expanded:
                    return #imageLiteral(resourceName: "collapse")
            }
        }
    }
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var carret: UIImageView!
    
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var detailView: UIView!
    
    private let expandedViewIndex: Int = 1
    
    var state: CellState = .collapsed {
        didSet {
            toggle()
        }
    }
    
    override func awakeFromNib() {
        selectionStyle = .none
        containerView.layer.cornerRadius = 10.0
    }
    
    func update(name: String, description: String) {
        titleLabel.text = name
    }
    
    private func toggle() {
        stackView.arrangedSubviews[expandedViewIndex].isHidden = stateIsCollapsed()
        topStackView.arrangedSubviews[expandedViewIndex].isHidden = !stateIsCollapsed()
        carret.image = state.carretImage
    }
    
    private func stateIsCollapsed() -> Bool {
        return state == .collapsed
    }
}
