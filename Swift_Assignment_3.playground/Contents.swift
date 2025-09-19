import UIKit

class Computer {
  var cpu: String
  var ram: Int
  var storage: Int
  var os: String

  init(cpu: String, ram: Int, storage: Int, os: String) {
    self.cpu = cpu
    self.ram = ram
    self.storage = storage
    self.os = os
  }
  
  func fullSpecs() -> String {
    return "Specifications:\n CPU: \(cpu)\n RAM: \(ram)\n Storage: \(storage)\n OS: \(os)"
  }
}

class GamingPC: Computer{
  var gpu: Bool
  var waterCooled: Bool
  var games: [String]
  
  init(cpu: String, ram: Int, storage: Int, os: String, gpu: Bool, waterCooled: Bool, games: [String]) {
    self.gpu = gpu
    self.waterCooled = waterCooled
    self.games = games
    super.init(cpu: cpu, ram: ram, storage: storage, os: os)
  }
    
  func addGame(_ games: String){
    self.games.append(games)
  }

  func hasDedicatedGPU() -> Bool {
    return gpu
  }
  
  override func fullSpecs() -> String {
    return super.fullSpecs() + "\n GPU: \(gpu ? "Yes" : "No")\n Water Cooling: \(waterCooled)"
  }
}

class Workstation: Computer{
  var software: [String]
  
  init(cpu: String, ram: Int, storage: Int, os: String, software: [String]) {
    self.software = software
    super.init(cpu: cpu, ram: ram, storage: storage, os: os)
  }

  func addSoftware(_ software: String){
    self.software.append(software)
  }

  override func fullSpecs() -> String {
    let softwareList = software.joined(separator: ", ")
    return super.fullSpecs() + "\n Installed Software: \(softwareList)"
  }
}

class Server: Computer{
  var hotSwappableBays: Int
  
  init(cpu: String, ram: Int, storage: Int, os: String, hotSwappableBays: Int) {
    self.hotSwappableBays = hotSwappableBays
    super.init(cpu: cpu, ram: ram, storage: storage, os: os)
  }
    
  override func fullSpecs() -> String {
    return super.fullSpecs() + "\n Hot-Swappable Bays: \(hotSwappableBays)"
  }

}

// create a GamingPC computer
let myGamingPC = GamingPC(
  cpu: "AMD Ryzen 9",
  ram: 32,
  storage: 1000,
  os: "Windows 11",
  gpu: true,
  waterCooled: true,
  games: ["Cyberpunk 2077", "Elden Ring", "Valorant"]
)

// print the full specifications
print(myGamingPC.fullSpecs())

// create a Workstation computer
let myWorkstation = Workstation(
  cpu: "Intel Core i9",
  ram: 64,
  storage: 2000,
  os: "macOS Ventura",
  software: ["Xcode", "Photoshop", "Final Cut Pro"]
)

// print the full specifications
print(myWorkstation.fullSpecs())


// create a server computer
let myServer = Server(cpu: "Intel Xeon", ram: 64, storage: 2000, os: "Linux", hotSwappableBays: 4)



/*
 Swift Assignment 3
 Goal
 Model a small computer lineup using inheritance and computed properties.

 You’ll build (details are listed in the Tasks section below)
 A Computer base class with common properties
 Three subclasses: GamingPC, Workstation, and Server
 Requirements:
 Include at least two computed properties overall (already present: uptimeHours, specSummary; subclasses may add more).
 Tasks
 Base class Computer

 Properties: manufacturer, model, cpuCores, clockGHz, memoryGB, totalStorageGB, architecture: String.

 Add the provided computed properties:

 uptimeHours (derived from uptimeSeconds)
 specSummary (a one-line description)
 Implement(as methods) tick(seconds:) to add to uptimeSeconds.

 Subclasses

 GamingPC: add gpuModel, waterCooled: Bool, and a small computed vibeScore.
 Workstation: add eccMemory: Bool, cudaCores: Int, and computed parallelThroughput.
 Server: add rackUnits, hotSwappableBays, and computed storagePerRU.
 Playground checks(testing your objects)

 Create one instance of each subclass with sensible values.

 print the computed properties to verify behavior:

 specSummary, uptimeHours, vibeScore, parallelThroughput, storagePerRU.
 Bonus marks (nice-to-have, not required) a challenge for the brave 💪
 Add one more computed property to any subclass (e.g., a friendly description).
 Light input validation in initializers (e.g., avoid rackUnits <= 0).
 A tiny helper like addStorage(_ gb: Int) to practice mutation.
 */
