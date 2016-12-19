//
//  Extensions.swift
//  BookAStylist
//
//  Created by Luis Castillo on 12/15/16.
//  Copyright © 2016 Castle Apps. All rights reserved.
//

import UIKit

extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func addConstraintsWithFormat(format: String, views: UIView..., options: NSLayoutFormatOptions) {
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: nil, views: viewsDictionary))
    }
}


// MARK: - Image Scaling.
extension UIImage {
    func scaleImageToSize(newSize: CGSize) -> UIImage {
        var scaledImageRect = CGRect.zero
        
        let aspectWidth = newSize.width/size.width
        let aspectheight = newSize.height/size.height
        
        let aspectRatio = max(aspectWidth, aspectheight)
        
        scaledImageRect.size.width = size.width * aspectRatio;
        scaledImageRect.size.height = size.height * aspectRatio;
        scaledImageRect.origin.x = (newSize.width - scaledImageRect.size.width) / 2.0;
        scaledImageRect.origin.y = (newSize.height - scaledImageRect.size.height) / 2.0;
        
        UIGraphicsBeginImageContext(newSize)
        draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
}



extension String {
    func NSRangeFromRange(range: Range<String.Index>) -> NSRange {
        let utf16view = self.utf16
        let from = String.UTF16View.Index(range.lowerBound, within: utf16view)
        let to = String.UTF16View.Index(range.upperBound, within: utf16view)
        return NSMakeRange(utf16view.startIndex.distance(to: from), from.distance(to: to))
        //return NSMakeRange(utf16view.startIndex.distanceTo(from), from.distanceTo(to))
    }
    
    mutating func dropTrailingNonAlphaNumericCharacters() {
        let nonAlphaNumericCharacters = NSCharacterSet.alphanumerics.inverted
        //let nonAlphaNumericCharacters = NSCharacterSet.alphanumericCharacterSet.invertedSet
        //let characterArray = componentsSeparatedByCharactersInSet(nonAlphaNumericCharacters)
        let characterArray = components(separatedBy: nonAlphaNumericCharacters)
        if let first = characterArray.first {
            self = first
        }
    }
}

extension UITextView {
    
    func underlined() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    public func resolveHashTags(possibleUserDisplayNames:[String]? = nil) {
        
        let schemeMap = [
            "#":"hash",
            "@":"mention"
        ]
        
        let words = self.text.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        //let words = self.text.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let attributedString = attributedText.mutableCopy() as! NSMutableAttributedString
        
        // keep track of where we are as we interate through the string.
        // otherwise, a string like "#test #test" will only highlight the first one.
        let bookmark = text.startIndex
        for word in words {
            
            var scheme:String? = nil
            
            if word.hasPrefix("#") {
                scheme = schemeMap["#"]
            } else if word.hasPrefix("@") {
                scheme = schemeMap["@"]
            }
            
            // Drop the # or @
            var wordWithTagRemoved = String(word.characters.dropFirst())
            
            // Drop any trailing punctuation
            wordWithTagRemoved.dropTrailingNonAlphaNumericCharacters()
            
            // Make sure we still have a valid word (i.e. not just '#' or '@' by itself, not #100)
            guard let schemeMatch = scheme, Int(wordWithTagRemoved) == nil && !wordWithTagRemoved.isEmpty
                else { continue }
            
            let remainingRange = Range(bookmark..<text.endIndex)
            
            if let matchRange = text.range(of: word, options: .literal, range: remainingRange, locale: Locale.current),
                let escapedString = wordWithTagRemoved.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                
                attributedString.addAttribute(NSLinkAttributeName, value: "\(schemeMatch):\(escapedString)", range: text.NSRangeFromRange(range: matchRange))
            }
        }
        
        self.attributedText = attributedString
    }
}

//extension UIViewController: UITextViewDelegate {
//    
//    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//        
//        if URL.scheme == "mention" {
//            print("Detected " + URL.absoluteString)
//            tappedUser = URL.absoluteString.replacingOccurrences(of: "mention:", with: "")
//            if tappedUser == USERNAME {
//                bGetTappedUser = false
//                //We should send user to their profile
//                self.tabBarController?.selectedIndex = 4
//            }else{
//                bGetTappedUser = true
//                let layout = UICollectionViewFlowLayout()
//                let viewController = TappedProfileController(collectionViewLayout: layout)
//                
//                
//                viewController.hidesBottomBarWhenPushed = true
//                self.navigationController?.pushViewController(viewController, animated: true)
//            }
//            
//            
//        }
//        
//        
//        return true
//    }
//}

//this extension makes it easier to hide the keyboard when user taps away from current view/subview
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlertWithTitle(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        
        alertVC.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    func showConfirmationAlert(title: String, message: String, bOK: @escaping ((Bool) -> Void)) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            bOK(true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
}

extension UITextField {
    func underlined() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
