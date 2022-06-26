//
//  BaseViewController.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation
import UIKit


class BaseViewController<T: BaseViewModel>: UIViewController {
     var viewModel: T?
}
