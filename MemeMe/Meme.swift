//
//  Meme.swift
//  MemeMe
//
//  Created by Wing Hon on 5/12/15.
//  Copyright (c) 2015 GE Healthcare. All rights reserved.
//

import Foundation
import UIKit

class Meme {
    var topText: String
    var bottomText: String
    var origImage: UIImage
    var memedImage: UIImage
    init(topText: String, bottomText: String, origImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.origImage = origImage
        self.memedImage = memedImage
    }
}