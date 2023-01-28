import Foundation

class MeterTable {
  let minDb: Float = -60.0
  var tableSize: Int // 300
  
  let scaleFactor: Float
  var meterTable = [Float]()
  
  init (tableSize: Int) {
    self.tableSize = tableSize
    
    let dbResolution = Float(minDb / Float(tableSize - 1))
    scaleFactor = 1.0 / dbResolution
    
    let minAmp = dbToAmp(dB: minDb)
    let ampRange = 1.0 - minAmp
    let invAmpRange = 1.0 / ampRange
    
    for i in 0..<tableSize {
      let decibels = Float(i) * dbResolution
      let amp = dbToAmp(dB: decibels)
      let adjAmp = (amp - minAmp) * invAmpRange
      meterTable.append(adjAmp)
    }
  }
  
  private func dbToAmp(dB: Float) -> Float {
    return powf(10.0, 0.05 * dB)
  }

  func valueFor(power: Float) -> Float {
    if power < minDb {
      return 0.0
    } else if power >= 0.0 {
      return 1.0
    } else {
      let index = Int(power * scaleFactor)
      return meterTable[index]
    }
  }
}
