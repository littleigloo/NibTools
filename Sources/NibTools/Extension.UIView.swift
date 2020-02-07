//
//  Extension.UIView.swift
//  VIPER Implementation
//
//  Created by Vitalis on 16/12/2019.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import UIKit

// ...........

public extension UIView {
    
    public class func fromNib() -> Self {
        return fromNib(type: self)
    }
    
    // ...........
    
    public class var xibName: String {
        
        // Check for SelfExplainable
        guard let explainable = self as? SelfExplainable.Type else {
            
            // Check for CustomXibNamable
            guard let customXibNamable = self as? CustomXibNamable.Type else {
                
                // Return Automatic name
                return automaticXibName
            }

            // Return customXibNamable name
            return customXibNamable.customXibName
        }
        
        // Return SelfExplainable name
        return explainable.customXibName
    }
    
    // ...........

    private class func fromNib<T : UIView>(type: T.Type) -> T {
        
        guard let nibList = Bundle.main.loadNibNamed(xibName, owner: nil, options: nil) else {
            fatalError("COULD NOT GET NIB LIST")
        }
        
        for view in nibList {
            if let castedView = view as? T {
                return castedView
            }
        }

        fatalError("VIEW FROM NIB NOT FOUND")
    }
    
    // ...........
    
    private class var automaticXibName: String {
        return "\(self)".components(separatedBy: ".").first ?? ""
    }
}
