import Foundation

struct ModuleConfiguration {
    var modules: [String: (type: ModuleType, destinations: [String])] = [:]
    var highPulses: Int = 0
    var lowPulses: Int = 0
}

enum ModuleType {
    case flipFlop(_ on: Bool)
    case conjunction(_ pulseHistory: [String: Pulse])
    case broadcaster
    
    func action(_ moduleName: String, _ pulse: Pulse) -> (updatedModule: ModuleType, nextPulse: Pulse?) {
        switch self {
        case .flipFlop(let on):
            switch pulse {
            case .high:
                return (.flipFlop(on), nil)
            case .low:
                return (.flipFlop(!on), !on ? .high : .low)
            }
        case .conjunction(let pulseHistory):
            return (.conjunction(pulseHistory), pulseHistory.allSatisfy({ $0.value == .high }) ? .low : .high)
        case .broadcaster:
            return (.broadcaster, pulse)
        }
    }
}

enum Pulse {
    case high
    case low
}

