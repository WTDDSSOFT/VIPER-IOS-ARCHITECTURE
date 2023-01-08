# VIPER-IOS-ARCHITECTURE
Deep Study  about VIPER Architecture  

## 1 View:   
   * It consists of our UI layer, UIViews and UIViewController subclasses establishing some hierarchy. No logic(conditional statements, loops, parsing) should be kept in there. All the outputs come from our ViewModel, oops! They come from our Presenter .

## 2 Presenter: 
     * It may correspond exactly to what the ViewModel does in the MVVM: presentation logic. 
     
     * Everything should be placed in there, deciding which is the context of our screen, what important data should be presented and the content should be kept in a UI-friendly language that is ready to fill our Views, without any parsing. Besides, Presenter must answer to all user interactions and decide when it's time to move to another scene and trigger the Router. 
     
     * The business rules that used to be implemented by our ViewModel in MVVM now moved to the Interactor .

### There is a discussing about the Presenter being equivalent to MVVM's ViewModel or MVP's Presenter. The answer is: both. It's up to you, if you want more reactive data to fill our UI on demand, implementing as an MVVM ViewModel is the best choice. If you want this layer to tell our View every time an update is needed, MVP's Presenter is the way.

## 3. Interactor: 
   * This layer corresponds to our use cases within the screen. Basically, every time we want to execute some logic inside our business domain, we should trigger some method that does that in our Interactor and returns some output. This class is also responsible of being a hub to data sources like API calls and data persistence.

## 4. Entity: 
   * I don't like to call that a layer because there is actually no abstraction inside an entity. Remember Entity-Relation diagrams from Peter Chen you learned in your Data Modeling course? It is just pure entities. It's just a struct/enum describing some entity inside our domain. No logic is needed, and usually they implement the Codable protocol.

## 5. Router: 
   * It's basically the class that is responsible for the Coordinator design pattern, same meaning. It should keep a reference to our UINavigationController (or the viewController itself) in order to perform push, pop and present operations and do a change of context. Besides, some people like to inject the navigation into ourRouter from Presenter instead of being a property. Most companies like to call this layer as Wireframe , personally I prefer Router , more declarative.

### For short, our procedure is that View sends user interactions to our Presenter, which may or not trigger some use cases in the Interactor or just change or presentation rules without any business logic. The Interactorperforms some use case operations relying on entities and send back the results to the Presenter, which change the presentation layers and force an update in our View.
