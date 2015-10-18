//
//  Sound.swift
//  answerball
//
//  Created by dev on 8/4/15.
//  Copyright (c) 2015 ciccio boles. All rights reserved.
//

import Foundation

class Sound {
    var fileName : String
    var fileExtension : String
    
    init(fileName: String, fileExtension: String) {
    self.fileName = fileName
        self.fileExtension = fileExtension
    
    
    }

}


let bark = Sound(fileName: "bark", fileExtension: "mp3")