This application allows the user to partake in a variety of different workouts fetched from a remote API, time themselves,
see a record of their past workouts, and calculate their BMI. It is modularised using a layered-feature approach, where modules
are created based on specific features and then internally divided into submodules for their data, domain and presentation layers.
Interactions between modules are conducted through use cases. The application utilises local notifications to remind the user to 
partake in their daily workout. It also utilises SwiftData to display a record of the user's past workouts. 
Swinject is used as the dependency injection framework.
