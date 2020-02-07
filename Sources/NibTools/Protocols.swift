//
//  Protocols.swift
//  VIPER Implementation
//
//  Created by Vitalis on 16/12/2019.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import UIKit

// ...........

public protocol Cell {}

// ...........

public extension UICollectionViewCell: Cell {}

// ...........

public extension UITableViewCell: Cell {}

//  MARK: -

public protocol SelfExplainable: CustomXibNamable where Self: Cell {
    static var cellId: String { get }
}

// ...........

public extension SelfExplainable where Self: Cell {
    
    static var customXibName: String {
        return "\(Self.self)"
    }
}

//  MARK: -

public public protocol CustomXibNamable {
    static var customXibName: String { get }
    var customXibName: String { get }
}

// ...........

public public extension CustomXibNamable {
    
    static var customXibName: String {
        return "\(Self.self)"
    }
    
    // ...........
    
    var customXibName: String {
        return "\(Self.customXibName)"
    }
}
