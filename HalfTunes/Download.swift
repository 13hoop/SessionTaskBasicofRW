//
//  Download.swift
//  HalfTunes
//
//  Created by YongRen on 2017/7/13.
//  Copyright © 2017年 Ray Wenderlich. All rights reserved.
//

import Foundation

class Download {
  
  var track: Track
  init(track: Track) {
    self.track = track
  }
  
  var task: URLSessionDownloadTask?
  var isDownloading = false
  var resumeData: Data?
  
  var progress:Float = 0.0
}
