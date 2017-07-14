//
//  Download.swift
//  HalfTunes
//
//  Created by YongRen on 2017/7/13.
//

import Foundation
/// 每一个下载任务就是一个新DownLoad， 便于缓存和管理
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
