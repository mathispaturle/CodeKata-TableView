//
//  02_Basic_Delegate.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 26/1/22.
//

import Foundation
import UIKit

final class Basic_02_Delegate: NSObject, UITableViewDelegate {
    private var view: Basics02?

    init(view: Basics02?) {
        self.view = view
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped cell at indexPath: \(indexPath)")
        
        view?.tapActionViewData(indexPath: indexPath)
    }
}
