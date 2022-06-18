//
//  Localizable.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 18.06.2022.
//



import Foundation

let subMainLabelTextArray = ["4", "5", "6", "7"]
var randomLabelElement = subMainLabelTextArray.randomElement()

let repeatActionButtonTextArray = ["9", "10", "11", "12"]
var randomRepeatButtonElement = repeatActionButtonTextArray.randomElement()


struct AppLocalizable {
    
    private static func convert2string(for key: String) -> String {
       return NSLocalizedString(key, comment: "")
    }
    
    public static let hello = convert2string(for: "1")
    public static let question = convert2string(for: "2")
    public static let mainDescription = convert2string(for: "3")
    public static  let subMainDescription = convert2string(for: "\(randomLabelElement!)")
    public static let actionButton = convert2string(for: "8")
    public static let repeatActionButton = convert2string(for: "\(randomRepeatButtonElement!)")
    public static let iWasHere = convert2string(for: "13")

     
    public static let restOfTheWeek = convert2string(for: "14")
    public static let myPlaces = convert2string(for: "15")
    public static let profile = convert2string(for: "16")
    public static let settings = convert2string(for: "17")
    public static let loguot = convert2string(for: "18")
    

    public static let typeOfCuisine = convert2string(for: "19")
    public static let fastFood = convert2string(for: "20")
    public static let bars = convert2string(for: "21")
    public static let cafe = convert2string(for: "22")
    public static let goVegan = convert2string(for: "23")
    public static let russian = convert2string(for: "24")
    public static let asian = convert2string(for: "25")
    public static let caucasian = convert2string(for: "26")

}
