# NYDataDemo
App that shows news data from NYTimes server.

This project uses the MVVM Design Pattern.
It has no storyboards, all the work is purely native swift through code ie. both Design & Developement.
It has a starting point from the AppDelegate, where you can select the language first.
Then it directs you to the homepage where all the data stored at the NYTimes Server is being fetched inside the tableview.
Both HomeVC & Second VC contains Marked CONSTRAINTS which has the actual design coded, marked UI which contains all the UIKit
views, marked VARIABLES which contains all the global file-restricted variables, marked CUSTOM CELLS which has all the UI of
the custom cell created for the tableViews n finaly marked DELEGATE & DATASOURCE which contains all the method requires to show
the tableview's contents to the user.
The project also contains third party frameworks installed through cocoapods & UIKit & UIFoundation Extensions n also contains
CUSTOM UI's required to have a wonderful design.
Default URL Session is used to pull data from server through custom Functions & 
then it has been hold by the DECODER's to inject it smoothly inside the views.
It has language VC where from the top right corner(if selected english) or top left corner(if selected arabic) you can anytime 
choose your language n then the UI will automatically switches accordingly.
