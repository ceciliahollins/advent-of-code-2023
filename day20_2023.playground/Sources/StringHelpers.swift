extension String {
    
    func inputToModuleConfiguration() -> ModuleConfiguration {
        
        var str = self
        var config = ModuleConfiguration()
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            var line = String(str[str.startIndex..<indexOfLine])
            var module = String(line[line.startIndex..<line.firstIndex(of: " ")!])
            let moduleSymbol = module.removeFirst()
            var moduleType: ModuleType
            let moduleName: String
            if moduleSymbol == "%" {
                moduleType = .flipFlop(false)
                moduleName = module
            } else if moduleSymbol == "&" {
                moduleType = .conjunction([:])
                moduleName = module
            } else {
                moduleType = .broadcaster
                moduleName = "broadcaster"
            }
            
            line.removeSubrange(line.startIndex...line.firstIndex(of: " ")!)
            line.removeSubrange(line.startIndex...line.firstIndex(of: " ")!)
            var destinations: [String] = []
            while !line.isEmpty {
                let indexOfSpace = line.firstIndex(of: " ") ?? line.endIndex
                let spaceSubrangeToDelete = line.firstIndex(of: " ") ?? line.index(line.endIndex, offsetBy: -1)
                var destination = String(line[line.startIndex..<indexOfSpace])
                if destination.last == "," { destination.removeLast() }
                destinations.append(destination)
                line.removeSubrange(line.startIndex...spaceSubrangeToDelete)
            }
            
            config.modules[moduleName] = (moduleType, destinations)
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        for (moduleName, module) in config.modules {
            for destination in module.destinations {
                switch config.modules[destination]?.type {
                case .conjunction(var pulseHistory):
                    pulseHistory[moduleName] = .low
                    config.modules[destination]?.type = .conjunction(pulseHistory)
                default:
                    continue
                }
            }
        }
        
        return config
    }
}
