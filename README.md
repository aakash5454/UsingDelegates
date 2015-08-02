# UsingDelegates
Delegation Design Pattern Explained and Implemented

Q:1 What is delegation Design Pattern? 

A:1 "Delegation is a simple and powerful pattern in which one object in an app acts on behalf of, or in coordination with, another object. The delegating object keeps a reference to the other object—the delegate—and at the appropriate time, the delegating object sends a message to the delegate. The message informs the delegate of an event that the delegating object is about to handle or has just handled. The delegate may respond to the message by updating the appearance (or state) of itself or of other objects in the app, and in some cases it will return a value that affects how an impending event is handled"[1].

Now the above text did not really make sense to me, until someone asked me to implement this project when I asked him to explain delegation. 

Download the project and Run.

As you can see, I have made a Reminder/Notes App. The app launches with a tableView (from, mainTableViewController) and you can create a reminder/Note by tapping on "+" button. This newly created note by tapping "+" is from a different controller (addViewController) and  "addViewController" passes information like Name, Date & Description to mainTableViewController when you tap on "Save". If you can notice this is backward communication between ViewControllers, exactly opposite of what happens in prepare for segue methods (i.e forward Communication between viewControllers). 

The Name and Description from addViewController is shown in mainTableViewController, as you can see it in the TableViewCell) 

Now when you tap on any cell, you are take to "detailViewController" from mainTableViewController which shows you the Reminder/Note in detail. Here the communication between mainTableViewController & detailViewController is forward communication that takes place from prepare from segue. Now when you tap on "Complete" again a backward communication takes place from "detailViewController" to mainTableViewController and a check mark appears on mainTableViewController indicating the Reminder/Notes is in complete status. This is again Delegation. 

In general delegation is asking someone to do work for you & also telling him to report back when the work is done, or work done in coloration between two parties, or sometimes to enable backward communication between two viewControlles(child to parent view controller communication). 

Now the best practice to use delegation in project is 
(1)Create a separate protocol file (look for savingRemainderProtocol.h in code)
(2)Make the required classes conform or adopt the protocol  (Hint: <  ...  >)
(3)Implement the delegate method body in the class that is asking other classes to do work for him. (hence in mainTableViewController)
(4)Create the delegate property in delegating classes (or the class doing work for someone, look for @property (nonatomic, weak) id<savingRemainderProtocol> savingRemainderDelegate; in code.)
(5)Make sure to assign delegate to child objects (look for detailVC.savingRemainderDelegate = self; in code)
(6)That is it. 

And last but not the least, delegation is always between two parties at a time. 
Now read the dictionary meaning of delegation and it will all make sense. 
Have any Question, Open a bug with Tag Discussion else Star this repo. Good Luck. 

[1]https://developer.apple.com/library/ios/referencelibrary/GettingStarted/RoadMapiOS/DesignPatterns.html
