/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A view controller that demonstrates how to use `UIButton`. The buttons are created using storyboards, but the attributed text button has its text set in code.
*/

import UIKit

class ButtonsViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet weak var attributedTextButton: UIButton!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAttributedTextSystemButton()
    }
    
    // MARK: IB Actions
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        /*
            Clicking a button fires a UIControlEventPrimaryActionTriggered event.
            The buttons in this view controller have been setup in Interface Builder
            to call this action for the UIControlEventPrimaryActionTriggered event.
        */
        print("A button was clicked.")
    }
    
    // MARK: Convenience
    
    fileprivate func configureAttributedTextSystemButton() {
        let buttonTitle = NSLocalizedString("Button", comment: "")
        
        // Set the button's title for normal state.
        let normalTitleAttributes = [
            convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.blue,
            convertFromNSAttributedStringKey(NSAttributedString.Key.strikethroughStyle): NSUnderlineStyle.single.rawValue
        ] as [String : Any]
        let normalAttributedTitle = NSAttributedString(string: buttonTitle, attributes: convertToOptionalNSAttributedStringKeyDictionary(normalTitleAttributes))
        attributedTextButton.setAttributedTitle(normalAttributedTitle, for: UIControl.State())
        
        // Set the button's title for highlighted state.
        let highlightedTitleAttributes = [
            convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.green,
            convertFromNSAttributedStringKey(NSAttributedString.Key.strikethroughStyle): NSUnderlineStyle.thick.rawValue
        ] as [String : Any]
        let highlightedAttributedTitle = NSAttributedString(string: buttonTitle, attributes: convertToOptionalNSAttributedStringKeyDictionary(highlightedTitleAttributes))
        attributedTextButton.setAttributedTitle(highlightedAttributedTitle, for: .highlighted)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
