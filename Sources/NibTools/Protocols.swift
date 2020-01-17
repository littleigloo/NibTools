//
//  Protocols.swift
//  VIPER Implementation
//
//  Created by Vitalis on 16/12/2019.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import UIKit

// ...........

protocol Cell {}

// ...........

extension UICollectionViewCell: Cell {}

// ...........

extension UITableViewCell: Cell {}

//  MARK: -

protocol SelfExplainable: CustomXibNamable where Self: Cell {
    static var cellId: String { get }
}

// ...........

extension SelfExplainable where Self: Cell {
    
    static var customXibName: String {
        return "\(Self.self)"
    }
}

//  MARK: -

protocol CustomXibNamable {
    static var customXibName: String { get }
    var customXibName: String { get }
}

// ...........

extension CustomXibNamable {
    
    static var customXibName: String {
        return "\(Self.self)"
    }
    
    // ...........
    
    var customXibName: String {
        return "\(Self.customXibName)"
    }
}
