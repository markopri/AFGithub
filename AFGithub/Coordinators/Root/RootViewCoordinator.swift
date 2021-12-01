//
//  RootViewCoordinator.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation
import UIKit

public protocol RootViewControllerProvider: class {
	///The coordinators 'rootViewController'. It helps to think of this as the view controller that can be used to dismiss the coordinator from the view hierarchy
	var rootViewController: UIViewController { get }
}

///A Coordinator type that provides a root UIViewController
public typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
