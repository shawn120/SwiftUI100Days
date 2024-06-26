# SwiftUI100Days
Personal Notes for [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)

Started from September 5th, 2023

## Notes Content

Code notes includ my solutions for each checkpoint. For some solutions I will add in some my own idea, but the main idea stay the same with the requirement and will still be able to demonstrate the same concept.

### Introduction to Swift (Days 1-14)

Day1-2: [Simple Data Type (Checkpoint 1)](/Day1-2_SimpleDataType.playground/Contents.swift)

Day3: [More Data Type](/Day3_MoreDataType.playground/Contents.swift)

Day4: [Type Annotations (Checkpoint 2)](/Day4_TypeAnnotations.playground/Contents.swift)

Day5: [Conditions](/Day5_Conditions.playground/Contents.swift)

Day6: [Loops (Checkpoint 3)](/Day6_Loops.playground/Contents.swift)

Day7-8: [Functions (Checkpoint 4)](/Day7-8_Functions.playground/Contents.swift)

Day9: [Closures (Checkpoint 5)](/Day9_Closures.playground/Contents.swift)

Day10-11: [Structs (Checkpoint 6)](/Day10-11_Structs.playground/Contents.swift)

Day12: [Classes (Checkpoint 7)](/Day12_Classes.playground/Contents.swift)

Day13: [Protocols and Extensions (Checkpoint 8)](/Day13_ProtocolsAndExtensions.playground/Contents.swift)

Day14: [Optionals (Checkpoint 9)](/Day14_Optionals.playground/Contents.swift)

### Consolidation I (Day 15)

Day15: [Swift Rivew (Reading)](https://www.hackingwithswift.com/articles/242/learn-essential-swift-in-one-hour)

### Starting SwiftUI (Days 16-24)

Project 1: [WeSplit](/WeSplit/WeSplit/ContentView.swift)
- [x] Day16: Part 1
- [x] Day17: Part 2
- [x] Day18: Part 3 (Challenge)
- [x] Day19: Challenge Day: [WeConvert](/WeConvert/WeConvert/ContentView.swift)

Project 2: [GuessTheFlag](/GuessTheFlag/GuessTheFlag/ContentView.swift)
- [x] Day20: Part 1
- [x] Day21: Part 2
- [x] Day22: Part 3 (Challenge)
- [x] Customized Challenge
  - [x] Added a `Total Rounds` picker, will disable when game start
  - [x] Added a `Start Over` button to reset game manually
  - [x] Added a customized `nextCorrectAnswer` function to prevent same flag to be selected again in a row
  - [x] Added more flags

Project 3: [ViewsAndModifiers (Technique)](/ViewsAndModifiers/ViewsAndModifiers/ContentView.swift) 
- [x] You will find example code of `custom modifiers`, `View composition (view wrap up)`, `custom binding`, `custom container (extra)` in this project file above
- [x] Day23: Part 1: Reading: [Technique Reading](https://www.hackingwithswift.com/100/swiftui/23)
- [x] Day24: Part 2: Challenge to project 1 & 2

### Consolidation II (Day 25)

Day25: Milestone:
- [x] Reading: [Custom bindings](https://www.hackingwithswift.com/guide/ios-swiftui/2/2/key-points) (Code example in [Project 3](/ViewsAndModifiers/ViewsAndModifiers/ContentView.swift))
- [x] Challenge: [RPSTeaser](/RPSTeaser/RPSTeaser/ContentView.swift)
- [x] Customized Challenge
  - [x] Added a `Total Rounds` picker, will disable when game start
  - [x] Added a `Restart` button to reset game manually
  - [x] Added a `Random Mode` toggle, toggle game mode between alternating promots and randomize promots, will disable when game start

### Expanding your skills (Days 26-34)

Project 4: [BetterRest](/BetterRest/BetterRest/ContentView.swift)
- [x] Day26: Part 1: Extra Watching: [Create ML for Everyone](https://youtu.be/a905KIBw1hs)
- [x] Day27: Part 2
- [x] Day28: Part 3 (Challenge) (~~using `onChange` and `onAppear`~~) (use computed variable)

Project 5: [WordScramble](/WordScramble/WordScramble/ContentView.swift)
- [x] Day29: Part 1: [Work with Spell checking from UIKit](https://www.hackingwithswift.com/books/ios-swiftui/working-with-strings)
- [x] Day30: Part 2
- [x] Day31: Part 3 (Challenge)

Porject 6: Animation (Technique)
- [x] Day32: Part 1: 
  - [x] Reading: [Simple Animations](https://www.hackingwithswift.com/100/swiftui/32)
  - [x] Code: [Implicit animations and customizing animations](/Animations/Animations/ContentView.swift)
  - [x] Code: [Animating bindings](/Animations/Animations/ContentView2.swift)
  - [x] Code: [Explicit animations](/Animations/Animations/ContentView3.swift)
- [x] Day33: Part 2:
  - [x] Reading: [Complex Animations](https://www.hackingwithswift.com/100/swiftui/33)
  - [x] Code: [Controlling the animation stack](/Animations/Animations/ContentView4.swift)
  - [x] Code: [Animating gestures](/Animations/Animations/ContentView5.swift)
  - [x] Code: [Gestures animation showing off](/Animations/Animations/HelloSwiftUIDragAnimation.swift)
  - [x] Code: [Showing and hiding views with transitions](/Animations/Animations/ContentView6.swift)
  - [x] Code: [Building custom transitions using ViewModifier](/Animations/Animations/ContentView7.swift)
- [x] Day34: Part 3 (Challenge on [GuessTheFlag](/GuessTheFlag/GuessTheFlag/ContentView.swift))

### Consolidation II (Day 35)

Day35: Milestone:
- [x] Challenge: [FunMultiplication (functional but need to be better)](/FunMultiplication/FunMultiplication/ContentView.swift)