import Foundation


public func pulsePropagation(_ input: String) -> Int {
    
    var config = input.inputToModuleConfiguration()

    for _ in 0..<1000 {
        var pulseQueue: [(moduleName: String, pulseSending: Pulse)] = [("broadcaster", .low)]
        while !pulseQueue.isEmpty {
            // get the first pulse in the queue
            let currPulse = pulseQueue.removeFirst()
            
            // update the config pulse tracker
            if currPulse.pulseSending == .high {
                config.highPulses += 1
            } else {
                config.lowPulses += 1
            }
            
            // ensure there is a module in the config for the name
            guard let currMod = config.modules[currPulse.moduleName] else { continue }
            
            // send the action for the current module with its pulse
            let action = currMod.type.action(currPulse.moduleName, currPulse.pulseSending)
            
            // update all the conjunction modules in the config
            config.modules = config.modules.mapValues { mod in
                switch mod.type {
                case .conjunction(var pulseHistory):
                    if pulseHistory[currPulse.moduleName] != nil && action.nextPulse != nil {
                        pulseHistory[currPulse.moduleName] = action.nextPulse
                    }
                    return (ModuleType.conjunction(pulseHistory), mod.destinations)
                default:
                    return mod
                }
            }
            
            // update the current module
            config.modules[currPulse.moduleName]!.type = action.updatedModule
            
            // add the next action to the queue
            if let nextPulse = action.nextPulse {
                for destination in config.modules[currPulse.moduleName]!.destinations {
                    pulseQueue.append((destination, nextPulse))
                }
            }
        }
    }
    
    return config.highPulses * config.lowPulses
}

public func pulsePropagationPartTwo(_ input: String) -> Int {
    
    var config = input.inputToModuleConfiguration()

    // continue pushing the button until rx is found
    var numOfButtonPushes = 0
    
    // get the module that contains rx
    let rxParent = config.modules.first(where: { $0.value.destinations.contains("rx") })!
    // create a tracker to find the lowest num of button pushes to get a true value
    var rxParentDestinationTracker: [String: Int] = [:]
    for (moduleName, module) in config.modules {
        if module.destinations.contains(rxParent.key) {
            rxParentDestinationTracker[moduleName] = Int.max
        }
    }
    
    while true {
        numOfButtonPushes += 1
        var pulseQueue: [(moduleName: String, pulseSending: Pulse)] = [("broadcaster", .low)]
        while !pulseQueue.isEmpty {
            // get the first pulse in the queue
            let currPulse = pulseQueue.removeFirst()
            
            // check if currPulse is a low pulse to rx
            if currPulse.moduleName == "rx", currPulse.pulseSending == .low {
                return numOfButtonPushes
            }
            
            // update the tracker if the parent is reached
            for (key, value) in rxParentDestinationTracker {
                switch config.modules[rxParent.key]!.type {
                case .conjunction(let pulseHistory):
                    if pulseHistory[key] == .high {
                        rxParentDestinationTracker[key] = min(value, numOfButtonPushes)
                    }
                default:
                    continue
                }
            }
            
            // update the config pulse tracker
            if currPulse.pulseSending == .high {
                config.highPulses += 1
            } else {
                config.lowPulses += 1
            }
            
            // ensure there is a module in the config for the name
            guard let currMod = config.modules[currPulse.moduleName] else { continue }
            
            // send the action for the current module with its pulse
            let action = currMod.type.action(currPulse.moduleName, currPulse.pulseSending)
            
            // update all the conjunction modules in the config
            config.modules = config.modules.mapValues { mod in
                switch mod.type {
                case .conjunction(var pulseHistory):
                    if pulseHistory[currPulse.moduleName] != nil && action.nextPulse != nil {
                        pulseHistory[currPulse.moduleName] = action.nextPulse
                    }
                    return (ModuleType.conjunction(pulseHistory), mod.destinations)
                default:
                    return mod
                }
            }
            
            // update the current module
            config.modules[currPulse.moduleName]!.type = action.updatedModule
            
            // add the next action to the queue
            if let nextPulse = action.nextPulse {
                for destination in config.modules[currPulse.moduleName]!.destinations {
                    pulseQueue.append((destination, nextPulse))
                }
            }
        }
                
        // check if all the tracker values are set, then the lcm can be found
        if !rxParentDestinationTracker.contains(where: { $0.value == Int.max }) {
            let nums = rxParentDestinationTracker.map({ $0.value })
            return lcm(nums)
        }
    }
}
