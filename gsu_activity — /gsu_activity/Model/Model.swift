//
//  Model.swift
//  gsu_activity
//
//  Created by юра шинкар on 10.01.23.
//

import UIKit

enum AuthResponce{
    case success, noVerify, error
}

struct Slides {
    var id: Int
    var text: String
    var img: UIImage
}

struct LoginField {
    var email: String
    var password: String
}

struct ResponceCode {
    var code: Int
}
