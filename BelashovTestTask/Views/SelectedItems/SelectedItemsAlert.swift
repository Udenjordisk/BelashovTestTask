//
//  SelectedItemsAlert.swift
//  BelashovTestTask
//
//  Created by Кирилл on 04.10.2022.
//

import UIKit

func showAlert() -> UIAlertController{
    
    let title = "Похоже вы выбрали максимальное количество статей"
    
    let message = "Самое время отправиться прочитать их! "
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
        //TODO: Present table view with selected cells
       
    }
    
    let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
        selectedItems.removeAll()
        //TODO: Deselect all cells
    }
    
    alert.addAction(okAction)
    alert.addAction(cancelAction)

    
    return alert
    
}
