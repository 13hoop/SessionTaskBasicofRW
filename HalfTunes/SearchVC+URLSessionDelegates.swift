//
//  SearchVC+URLSessionDelegates.swift
//  HalfTunes
//
//  Created by YongRen on 2017/7/13.
//  Copyright © 2017年 Ray Wenderlich. All rights reserved.
//

import Foundation

extension SearchViewController: URLSessionDownloadDelegate {
  /// 将下载的临时文件移动到想要存储的沙盒位置，避免在此方法完成之后自动删除,并在完成操作之后更新UI
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    print("   |--> Finished downloading to \(location).")
    
    guard let sourceUrl = downloadTask.originalRequest?.url else { return }
    let download = downloadService.activeDownloads[sourceUrl]
    downloadService.activeDownloads[sourceUrl] = nil
    
    // 利用lastPathComponent为文件名拼接本地路径
    let destinationUrl = localFilePath(for: sourceUrl)
    print("   |-->", destinationUrl)
    
    let fileManager = FileManager.default
    try? fileManager.removeItem(at: destinationUrl)
    do {
      try fileManager.copyItem(at: location, to: destinationUrl)
      download?.track.downloaded = true
    }catch {
      print("复制临时文件失败")
    }
    
    if let index = download?.track.index {
      DispatchQueue.main.async {
        self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
      }
    }
  }
  
}
