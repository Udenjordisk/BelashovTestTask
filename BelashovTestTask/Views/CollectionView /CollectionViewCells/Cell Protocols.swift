//
//  Cell Protocols.swift
//  BelashovTestTask
//
//  Created by Кирилл on 04.10.2022.
//

import UIKit

protocol ConfigurableCell{
    func configure(model: Model, indexPath: IndexPath)
}

protocol SelectableCell{
    func selectCell(model: Model, indexPath: IndexPath)
    func deselectCell(model: Model, indexPath: IndexPath)
}
