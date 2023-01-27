// MARK: - NotificationCenter
/*
private func addNotifications() {
    let notificationCenter = NotificationCenter()
    notificationCenter.addObserver(
        self, selector: #selector(handleRouteChange),
        name: AVAudioSession.routeChangeNotification, object: nil)
    notificationCenter.addObserver(
        self, selector: #selector(handleInteruption),
        name: AVAudioSession.interruptionNotification, object: nil)
}

@objc private func handleInteruption(notification: Notification) {
    if let info = notification.userInfo,
       let rawValue = info[AVAudioSessionInterruptionTypeKey] as? UInt {
        let type = AVAudioSession.InterruptionType(rawValue: rawValue)
        if type == .began {
            if status == .playing {
                stopPlayback()
            } else if status == .recording {
                stopRecord()
            }
        } else {
            if let rawValue = info[AVAudioSessionInterruptionOptionKey] as? UInt {
                let options = AVAudioSession.InterruptionOptions(rawValue: rawValue)
                if options == .shouldResume {
                    
                }
            }
        }
    }
}

@objc private func handleRouteChange(notification: Notification) {
    if let info = notification.userInfo,
       let rawValue = info[AVAudioSessionRouteChangeReasonKey] as? UInt {
        let reason = AVAudioSession.RouteChangeReason(rawValue: rawValue)
        if reason == .oldDeviceUnavailable {
            guard let previousRoute = info[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription,
                  let previousOutput = previousRoute.outputs.first else {
                return
            }
            if previousOutput.portType == .headphones {
                if status == .playing {
                    stopPlayback()
                } else if status == .recording {
                    stopRecord()
                }
            }
        }
    }
}
*/
