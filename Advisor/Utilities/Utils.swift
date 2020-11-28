//
//  Utils.swift
//  CollegeOne
//
//  Created by Cesar Corona Cabrera on 25/10/18.
//  Copyright © 2018 CollegeOne. All rights reserved.
//

import Foundation



import Foundation
import UIKit


extension Float {
    
    func formatWithFractionDigits(_ fractionDigits: Int, customDecimalSeparator: String? = nil) -> String {
        
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.maximumFractionDigits = fractionDigits
        fmt.minimumFractionDigits = fractionDigits
        fmt.decimalSeparator = customDecimalSeparator ?? fmt.decimalSeparator
        
        return  fmt.string(from: NSNumber(value: self)) ?? ""
    }
}


extension String {
    
    func toFloat(_ localeIdentifier: String? = nil) -> Float {
        let locale = localeIdentifier != nil ?  Locale(identifier: localeIdentifier!) : Locale.current
        
        let fmt = NumberFormatter()
        fmt.locale = locale
        fmt.numberStyle = .decimal
        fmt.maximumFractionDigits = 2
        fmt.roundingMode = .down
        
        return fmt.number(from: self)?.floatValue ?? 0
    }
    
    func sliderAttributeString(intFont: UIFont, decimalFont: UIFont, customDecimalSeparator: String? = nil) -> NSAttributedString {
        guard self != "" else { return NSAttributedString(string: "") }
        
        let locale = Locale.current
        let fmt = NumberFormatter()
        fmt.locale = locale
        fmt.decimalSeparator = customDecimalSeparator ?? fmt.decimalSeparator
        
        let numberComponents = components(separatedBy: fmt.decimalSeparator)
        
        let attributeString = NSMutableAttributedString()
        var integerStr = numberComponents[0]
        
        var decimalStr = ""
        if numberComponents.count > 1 {
            integerStr += fmt.decimalSeparator
            decimalStr =  numberComponents[1]
        }
        
        let integer = NSMutableAttributedString(string: integerStr)
        let decimal = NSMutableAttributedString(string: decimalStr)
        
        
        attributeString.append(integer)
        attributeString.append(decimal)
        
        return attributeString
    }
    
    func imANumer() -> Bool {
        
        let numberRegEx  = "^-?[0-9][0-9,\\.]+$"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        
        let containsNumber = testCase.evaluate(with: self)
        
        return containsNumber
        
    }
    
    var int : Int {
        
        if self.imANumer() {
            return Int(self)!
        } else {
            return 0
        }
    }
}


extension NSObject{
    
    func generateAppDateString(date:Date)->String{
        
        let formatter = DateFormatter()
        formatter.locale =  Locale(identifier: "pt_BR")
        formatter.dateFormat = "yyyyMMddHHmmss"
        let prettyDate = formatter.string(from: date)
        return prettyDate
    }
    
    func generateDateString(date:Date)->String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let prettyDate = formatter.string(from: date)
        return prettyDate
    }
    
    func generateDateString(oldFormat:String,newString:String)->String{
        let oldformatter = DateFormatter()
        oldformatter.dateFormat = "yyyy-MM-dd"
        let prettyDate = oldformatter.date(from: oldFormat)
        let newFormater = DateFormatter()
        newFormater.dateFormat = "dd MMMM yyyy"
        return newFormater.string(from: prettyDate!)
    }
    
    func generateStringOfAppDateWithStrings(date:Date)->String{
        let formatter = DateFormatter()
        formatter.locale =  Locale(identifier: "pt_BR")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let prettyDate = formatter.string(from: date)
        return prettyDate
    }
    func setFormatAppDateString(date:String)->String{
        
        let formatter = DateFormatter()
        formatter.locale =  Locale(identifier: "pt_BR")
        formatter.dateFormat = "yyyyMMddHHmmss"
        let prettyDate = formatter.string(from: formatter.date(from: date)!)
        return prettyDate
    }
    
    /// Calculated a date with timezone offset it's depend of user configuration
    ///
    /// - Parameter minutes: diference of minutes
    /// - Returns: Date changed by offset
    func calculatedTimeFromOffset(minutes:Int)->Date{
        var localDate = NSDate.init()
        let remoteSeconds = minutes * 60
        let localSeconds = NSTimeZone.system.secondsFromGMT()
        let intervalSeconds = remoteSeconds - localSeconds;
        localDate = localDate.addingTimeInterval(TimeInterval(intervalSeconds))
        return localDate as Date
    }
    
    func frameForBanner() -> CGRect{
        var safeAreaR: CGFloat = 0.0
        var safeAreaL: CGFloat = 0.0
        let width = UIScreen.main.bounds.size.width
        if #available(iOS 11.0, *) {
            if let safeAreaR11 = UIApplication.shared.keyWindow?.safeAreaInsets.right {
                safeAreaR = safeAreaR11
            }
            if let safeAreaL11 = UIApplication.shared.keyWindow?.safeAreaInsets.left {
                safeAreaL = safeAreaL11
            }
        }
        
        let xAxis = (UIScreen.main.bounds.size.height * 0.15) //Will appear below the logo
        return CGRect(x: safeAreaL, y: xAxis, width: width - safeAreaR, height: 30)
    }
    
    func getdBoldedText(fullString: NSString, boldPartsOfString: Array<NSString>, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
        
        let nonBoldFontAttribute = [NSAttributedString.Key.font:font!]
        let boldFontAttribute = [NSAttributedString.Key.font:boldFont!]
        let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
        for i in 0 ..< boldPartsOfString.count {
            boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartsOfString[i] as String))
        }
        return boldString
    }
}


extension UIWindow {
    func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController = UIApplication.shared.keyWindow?.rootViewController {
            return UIWindow.getVisibleViewController(viewController: rootViewController)
        }
        return nil
    }
    
    class func getVisibleViewController(viewController: UIViewController?) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return getVisibleViewController(viewController: navigationController.visibleViewController)
        }
        if let tabBarController = viewController as? UITabBarController {
            return getVisibleViewController(viewController: tabBarController.selectedViewController)
        }
        if let splitViewController = viewController as? UISplitViewController {
            return getVisibleViewController(viewController: splitViewController.viewControllers.last)
        }
        if let presentedViewController = viewController?.presentedViewController {
            return getVisibleViewController(viewController: presentedViewController)
        }
        
        return viewController
    }
    
    
    func visibleViewControllerForWindow(window: UIWindow?,  exceptions: Array<AnyObject.Type>?) -> UIViewController? {
        if let rootViewController: UIViewController = window?.rootViewController {
            return UIWindow.getVisibleViewController(viewController: rootViewController, exceptions: exceptions)
        }
        return nil
    }
    
    class func getVisibleViewController(viewController: UIViewController?, exceptions: Array<AnyObject.Type>?) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return getVisibleViewController(viewController: navigationController.visibleViewController)
        }
        if let tabBarController = viewController as? UITabBarController {
            return getVisibleViewController(viewController: tabBarController.selectedViewController)
        }
        if let splitViewController = viewController as? UISplitViewController {
            return getVisibleViewController(viewController: splitViewController.viewControllers.last)
        }
        if let presentedViewController = viewController?.presentedViewController {
            let numberCount = exceptions?.count ?? 0
            if numberCount > 0 {
                var allowed = true
                for vcType in exceptions! {
                    //                    print("JG pvcException \(vcType)")
                    //                    print("JG pvc presentedview \(String(describing: presentedViewController))")
                    if presentedViewController.isKind(of: vcType) {
                        //                        print("JG Mismo tipo de pvc. Es un controlador no permitido, no se mostrará")
                        allowed = false
                        break
                    }
                }
                
                if allowed {
                    return getVisibleViewController(viewController: presentedViewController)
                } else {
                    return nil
                }
                
            } else {
                return getVisibleViewController(viewController: presentedViewController)
            }
        }
        
        if let vc = viewController {
            let numberCount = exceptions?.count ?? 0
            if numberCount > 0 {
                
                var allowed = true
                for vcType in exceptions! {
                    //                    print("JG vcException \(vcType)")
                    //                    print("JG vc presentedview  \(String(describing: vc.self))")
                    
                    if vc.isKind(of: vcType) {
                        //                        print("JG Mismo tipo de vc. Es un controlador no permitido, no se mostrará")
                        allowed = false
                        break
                    }
                }
                
                if allowed {
                    return viewController
                } else {
                    return nil
                }
                
                
            } else {
                return viewController
            }
        } else {
            return nil
        }
    }
}



extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func customStringFormatting(splitSize: Int, separator: String) -> String {
        let chars = chunkArray(s: Array(self), splitSize: splitSize)
        return chars.map{ String($0) }.joined(separator: separator)
    }
    
    func chunkArray<T>(s: [T], splitSize: Int) -> [[T]] {
        if s.count <= splitSize {
            return [s]
        } else {
            return [Array<T>(s[0..<splitSize])] + chunkArray(s: Array<T>(s[splitSize..<s.count]), splitSize: splitSize)
        }
    }
    
    
}


extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

extension String {
    /// Returns a new string made by replacing all HTML character entity references with the corresponding character.
    ///
    /// - Returns: decoded string
    func decodingHTMLEntities() -> String {
        var result = String()
        var position = startIndex
        
        // Get the range to the next '&'
        while let ampRange = range(of: "&", range: position ..< endIndex) {
            result += self[position ..< ampRange.lowerBound]
            position = ampRange.lowerBound
            
            // Get the range to the next ';'
            if let semiRange = range(of: ";", range: position ..< endIndex ) {
                if let nextAmpRange = range(of: "&", range: index(position, offsetBy: 1) ..< endIndex ),
                    nextAmpRange.upperBound < semiRange.upperBound {
                    // We have an other "&" before the next ";", let's add it and step over.
                    result += "&"
                    position = index(ampRange.lowerBound, offsetBy: 1)
                } else {
                    let entity = String(self[position ..< semiRange.upperBound])
                    if let decoded = decode(entity: entity) {
                        // Add the decoded character.
                        result.append(decoded)
                    } else {
                        // Character wasn't decoded, append the entry.
                        result += entity
                    }
                    position = semiRange.upperBound
                }
            } else {
                // No remaining ';'.
                break
            }
        }
        
        // Add remaining characters.
        result += self[position ..< endIndex]
        return result
    }
}

private extension String {
    
    /// Convert the numeric value to the corresponding Unicode character
    ///    e.g.
    ///    decodeNumeric("64", 10) -> "@"
    ///    decodeNumeric("20ac", 16) -> "€"
    ///
    /// - Parameters:
    ///   - string: the string to decode
    ///   - base: base value of the integer
    /// - Returns: the resulting character
    func decodeNumeric(string: String, base: Int32) -> Character? {
        let code = UInt32(strtoul(string, nil, base))
        if let unicodeScalar = UnicodeScalar(code) {
            return Character(unicodeScalar)
        }
        return nil
    }
    
    /// Decode the HTML character entity to the corresponding
    /// Unicode character, return `nil` for invalid input.
    ///     decode("&#64;")    -> "@"
    ///     decode("&#x20ac;") -> "€"
    ///     decode("&lt;")     -> "<"
    ///     decode("&foo;")    -> nil
    ///
    /// - Parameter entity: The entity reference
    /// - Returns: the resulting character
    func decode(entity: String) -> Character? {
        if let character = String.characterEntities[entity] {
            return character
        } else if entity.hasPrefix("&#x") || entity.hasPrefix("&#X") {
            let number = String(entity[entity.index(entity.startIndex, offsetBy: 3)...].dropLast())
            return decodeNumeric(string: number, base: 16)
        } else if entity.hasPrefix("&#") {
            let number = String(entity[entity.index(entity.startIndex, offsetBy: 2)...].dropLast())
            return decodeNumeric(string: number, base: 10)
        } else {
            return nil
        }
    }
    
    // Mapping from XML/HTML character entity reference to character
    static let characterEntities: [String: Character] = [
        // Taken from http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
        // Complete refrence here https://www.w3.org/TR/xml-entity-names/
        "&quot;": "\u{0022}",
        "&amp;": "\u{0026}",
        "&apos;": "\u{0027}",
        "&lt;": "\u{003C}",
        "&gt;": "\u{003E}",
        "&nbsp;": "\u{00A0}",
        "&iexcl;": "\u{00A1}",
        "&cent;": "\u{00A2}",
        "&pound;": "\u{00A3}",
        "&curren;": "\u{00A4}",
        "&yen;": "\u{00A5}",
        "&brvbar;": "\u{00A6}",
        "&sect;": "\u{00A7}",
        "&uml;": "\u{00A8}",
        "&copy;": "\u{00A9}",
        "&ordf;": "\u{00AA}",
        "&laquo;": "\u{00AB}",
        "&not;": "\u{00AC}",
        "&shy;": "\u{00AD}",
        "&reg;": "\u{00AE}",
        "&macr;": "\u{00AF}",
        "&deg;": "\u{00B0}",
        "&plusmn;": "\u{00B1}",
        "&sup2;": "\u{00B2}",
        "&sup3;": "\u{00B3}",
        "&acute;": "\u{00B4}",
        "&micro;": "\u{00B5}",
        "&para;": "\u{00B6}",
        "&middot;": "\u{00B7}",
        "&cedil;": "\u{00B8}",
        "&sup1;": "\u{00B9}",
        "&ordm;": "\u{00BA}",
        "&raquo;": "\u{00BB}",
        "&frac14;": "\u{00BC}",
        "&frac12;": "\u{00BD}",
        "&frac34;": "\u{00BE}",
        "&iquest;": "\u{00BF}",
        "&Agrave;": "\u{00C0}",
        "&Aacute;": "\u{00C1}",
        "&Acirc;": "\u{00C2}",
        "&Atilde;": "\u{00C3}",
        "&Auml;": "\u{00C4}",
        "&Aring;": "\u{00C5}",
        "&AElig;": "\u{00C6}",
        "&Ccedil;": "\u{00C7}",
        "&Egrave;": "\u{00C8}",
        "&Eacute;": "\u{00C9}",
        "&Ecirc;": "\u{00CA}",
        "&Euml;": "\u{00CB}",
        "&Igrave;": "\u{00CC}",
        "&Iacute;": "\u{00CD}",
        "&Icirc;": "\u{00CE}",
        "&Iuml;": "\u{00CF}",
        "&ETH;": "\u{00D0}",
        "&Ntilde;": "\u{00D1}",
        "&Ograve;": "\u{00D2}",
        "&Oacute;": "\u{00D3}",
        "&Ocirc;": "\u{00D4}",
        "&Otilde;": "\u{00D5}",
        "&Ouml;": "\u{00D6}",
        "&times;": "\u{00D7}",
        "&Oslash;": "\u{00D8}",
        "&Ugrave;": "\u{00D9}",
        "&Uacute;": "\u{00DA}",
        "&Ucirc;": "\u{00DB}",
        "&Uuml;": "\u{00DC}",
        "&Yacute;": "\u{00DD}",
        "&THORN;": "\u{00DE}",
        "&szlig;": "\u{00DF}",
        "&agrave;": "\u{00E0}",
        "&aacute;": "\u{00E1}",
        "&acirc;": "\u{00E2}",
        "&atilde;": "\u{00E3}",
        "&auml;": "\u{00E4}",
        "&aring;": "\u{00E5}",
        "&aelig;": "\u{00E6}",
        "&ccedil;": "\u{00E7}",
        "&egrave;": "\u{00E8}",
        "&eacute;": "\u{00E9}",
        "&ecirc;": "\u{00EA}",
        "&euml;": "\u{00EB}",
        "&igrave;": "\u{00EC}",
        "&iacute;": "\u{00ED}",
        "&icirc;": "\u{00EE}",
        "&iuml;": "\u{00EF}",
        "&eth;": "\u{00F0}",
        "&ntilde;": "\u{00F1}",
        "&ograve;": "\u{00F2}",
        "&oacute;": "\u{00F3}",
        "&ocirc;": "\u{00F4}",
        "&otilde;": "\u{00F5}",
        "&ouml;": "\u{00F6}",
        "&divide;": "\u{00F7}",
        "&oslash;": "\u{00F8}",
        "&ugrave;": "\u{00F9}",
        "&uacute;": "\u{00FA}",
        "&ucirc;": "\u{00FB}",
        "&uuml;": "\u{00FC}",
        "&yacute;": "\u{00FD}",
        "&thorn;": "\u{00FE}",
        "&yuml;": "\u{00FF}",
        "&OElig;": "\u{0152}",
        "&oelig;": "\u{0153}",
        "&Scaron;": "\u{0160}",
        "&scaron;": "\u{0161}",
        "&Yuml;": "\u{0178}",
        "&fnof;": "\u{0192}",
        "&circ;": "\u{02C6}",
        "&tilde;": "\u{02DC}",
        "&Alpha;": "\u{0391}",
        "&Beta;": "\u{0392}",
        "&Gamma;": "\u{0393}",
        "&Delta;": "\u{0394}",
        "&Epsilon;": "\u{0395}",
        "&Zeta;": "\u{0396}",
        "&Eta;": "\u{0397}",
        "&Theta;": "\u{0398}",
        "&Iota;": "\u{0399}",
        "&Kappa;": "\u{039A}",
        "&Lambda;": "\u{039B}",
        "&Mu;": "\u{039C}",
        "&Nu;": "\u{039D}",
        "&Xi;": "\u{039E}",
        "&Omicron;": "\u{039F}",
        "&Pi;": "\u{03A0}",
        "&Rho;": "\u{03A1}",
        "&Sigma;": "\u{03A3}",
        "&Tau;": "\u{03A4}",
        "&Upsilon;": "\u{03A5}",
        "&Phi;": "\u{03A6}",
        "&Chi;": "\u{03A7}",
        "&Psi;": "\u{03A8}",
        "&Omega;": "\u{03A9}",
        "&alpha;": "\u{03B1}",
        "&beta;": "\u{03B2}",
        "&gamma;": "\u{03B3}",
        "&delta;": "\u{03B4}",
        "&epsilon;": "\u{03B5}",
        "&zeta;": "\u{03B6}",
        "&eta;": "\u{03B7}",
        "&theta;": "\u{03B8}",
        "&iota;": "\u{03B9}",
        "&kappa;": "\u{03BA}",
        "&lambda;": "\u{03BB}",
        "&mu;": "\u{03BC}",
        "&nu;": "\u{03BD}",
        "&xi;": "\u{03BE}",
        "&omicron;": "\u{03BF}",
        "&pi;": "\u{03C0}",
        "&rho;": "\u{03C1}",
        "&sigmaf;": "\u{03C2}",
        "&sigma;": "\u{03C3}",
        "&tau;": "\u{03C4}",
        "&upsilon;": "\u{03C5}",
        "&phi;": "\u{03C6}",
        "&chi;": "\u{03C7}",
        "&psi;": "\u{03C8}",
        "&omega;": "\u{03C9}",
        "&thetasym;": "\u{03D1}",
        "&upsih;": "\u{03D2}",
        "&piv;": "\u{03D6}",
        "&ensp;": "\u{2002}",
        "&emsp;": "\u{2003}",
        "&thinsp;": "\u{2009}",
        "&zwnj;": "\u{200C}",
        "&zwj;": "\u{200D}",
        "&lrm;": "\u{200E}",
        "&rlm;": "\u{200F}",
        "&ndash;": "\u{2013}",
        "&mdash;": "\u{2014}",
        "&lsquo;": "\u{2018}",
        "&rsquo;": "\u{2019}",
        "&sbquo;": "\u{201A}",
        "&ldquo;": "\u{201C}",
        "&rdquo;": "\u{201D}",
        "&bdquo;": "\u{201E}",
        "&dagger;": "\u{2020}",
        "&Dagger;": "\u{2021}",
        "&bull;": "\u{2022}",
        "&hellip;": "\u{2026}",
        "&permil;": "\u{2030}",
        "&prime;": "\u{2032}",
        "&Prime;": "\u{2033}",
        "&lsaquo;": "\u{2039}",
        "&rsaquo;": "\u{203A}",
        "&oline;": "\u{203E}",
        "&frasl;": "\u{2044}",
        "&euro;": "\u{20AC}",
        "&image;": "\u{2111}",
        "&weierp;": "\u{2118}",
        "&real;": "\u{211C}",
        "&trade;": "\u{2122}",
        "&alefsym;": "\u{2135}",
        "&larr;": "\u{2190}",
        "&uarr;": "\u{2191}",
        "&rarr;": "\u{2192}",
        "&darr;": "\u{2193}",
        "&harr;": "\u{2194}",
        "&crarr;": "\u{21B5}",
        "&lArr;": "\u{21D0}",
        "&uArr;": "\u{21D1}",
        "&rArr;": "\u{21D2}",
        "&dArr;": "\u{21D3}",
        "&hArr;": "\u{21D4}",
        "&forall;": "\u{2200}",
        "&part;": "\u{2202}",
        "&exist;": "\u{2203}",
        "&empty;": "\u{2205}",
        "&nabla;": "\u{2207}",
        "&isin;": "\u{2208}",
        "&notin;": "\u{2209}",
        "&ni;": "\u{220B}",
        "&prod;": "\u{220F}",
        "&sum;": "\u{2211}",
        "&minus;": "\u{2212}",
        "&lowast;": "\u{2217}",
        "&radic;": "\u{221A}",
        "&prop;": "\u{221D}",
        "&infin;": "\u{221E}",
        "&ang;": "\u{2220}",
        "&and;": "\u{2227}",
        "&or;": "\u{2228}",
        "&cap;": "\u{2229}",
        "&cup;": "\u{222A}",
        "&int;": "\u{222B}",
        "&there4;": "\u{2234}",
        "&sim;": "\u{223C}",
        "&cong;": "\u{2245}",
        "&asymp;": "\u{2248}",
        "&ne;": "\u{2260}",
        "&equiv;": "\u{2261}",
        "&le;": "\u{2264}",
        "&ge;": "\u{2265}",
        "&sub;": "\u{2282}",
        "&sup;": "\u{2283}",
        "&nsub;": "\u{2284}",
        "&sube;": "\u{2286}",
        "&supe;": "\u{2287}",
        "&oplus;": "\u{2295}",
        "&otimes;": "\u{2297}",
        "&perp;": "\u{22A5}",
        "&sdot;": "\u{22C5}",
        "&lceil;": "\u{2308}",
        "&rceil;": "\u{2309}",
        "&lfloor;": "\u{230A}",
        "&rfloor;": "\u{230B}",
        "&lang;": "\u{2329}",
        "&rang;": "\u{232A}",
        "&loz;": "\u{25CA}",
        "&spades;": "\u{2660}",
        "&clubs;": "\u{2663}",
        "&hearts;": "\u{2665}",
        "&diams;": "\u{2666}",
        
        // Special cases from Windows-1252. https://en.wikipedia.org/wiki/Windows-1252
        "&#128;": "\u{20AC}",
        "&#130;": "\u{201A}",
        "&#131;": "\u{0192}",
        "&#132;": "\u{201E}",
        "&#133;": "\u{2026}",
        "&#134;": "\u{2020}",
        "&#135;": "\u{2021}",
        "&#136;": "\u{02C6}",
        "&#138;": "\u{0160}",
        "&#139;": "\u{2039}",
        "&#140;": "\u{0152}",
        "&#142;": "\u{017D}",
        "&#145;": "\u{2018}",
        "&#146;": "\u{2019}",
        "&#147;": "\u{201C}",
        "&#148;": "\u{201D}",
        "&#149;": "\u{2022}",
        "&#150;": "\u{2013}",
        "&#151;": "\u{2014}",
        "&#152;": "\u{02DC}",
        "&#153;": "\u{2122}",
        "&#154;": "\u{0161}",
        "&#155;": "\u{203A}",
        "&#156;": "\u{0153}",
        "&#158;": "\u{017E}",
        "&#159;": "\u{0178}"
    ]
}

