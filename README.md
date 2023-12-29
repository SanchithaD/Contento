# Contento
Girls Technovation Challenge 2020

Contento is an app made to aid senior citizens especially with the quarantine situation. In America alone, sixteen million seniors face memory and health issues. Contento helps keep seniors stay safe, keep in touch with family, and gain a sense of independence. Some of Contento’s main features include notification to emergency contacts if user is immobile, ML (machine learning) model based reminders, easy access to emergency contacts and medical records, a location tracker to ensure user safety, and a mind calming feature. Contento provides features to refresh the user's memory such as brain strengthening games as well as an entertainment module to refresh old memories from the user's camera roll. Contento will make senior care easier, safer, and better as a whole.


# Directions To Run App
If you do not have CocoaPods installed, open terminal and enter in: 
$ sudo gem install cocoapods

Open the Podfile in the app and add the following under   # Pods for Contento:
pod 'Resolver'
pod 'Disk', '~> 0.6.4'

pod 'Firebase/Auth'
pod 'Firebase/Analytics'
pod 'Firebase/Firestore'
pod 'FirebaseFirestoreSwift'

pod 'Firebase/Functions' 

Open terminal, and enter in:
$ pod install

Open Contento.xcworkspace
Run app. Note that the first time you run it on a mobile device, rather than the simulator, it can take up to 15 minutes for the app to run, as it is installing all the frameworks.

