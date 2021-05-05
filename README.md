# lifecounter
INFO 449 HW5&amp;6: Life Counter

Stories:

- As a user, when I launch the application, it should show me four “players”. Each “player” should have a label for their life total, and four pushbuttons (“+”, “-“,”+5”,”-5”).
- As a user, when I push the “+” pushbutton for player 1, it should increment player 1’s life total by 1. “-“ should reduce the life total by 1, “+5” should increment by 5, and “-5” should decrement by 5.
- As a user, when a player's life total drops to 0 or less, it should display a label at the bottom of the app saying "Player X LOSES!"
- As a user, when I rotate the device (landscape to portrait mode or vice versa), it should resize itself evenly.
- As a user, when I run the app on different devices, it should seem "equally balanced" on each device, regardless of orientation. Players' life total labels should be proportional, buttons proportional, and so on.

- As a user, I often want to add/remove life in chunks other than 5 at a time; change the "+5"/"-5" buttons to be a paired button and edit control (numeric input only).
- As a user, when I launch the application, it should show me four “players”, but allow for a flexible number of players in total, from 2 to 8. It should have an "add player" button near the top that, when pressed, adds a new player to the game (with a stating life total of 20). After a game has started (any player's life totals have changed), the "add player" button should be disabled until the game is over.
- As a user, I often want to look back at the history of the game; create a new screen, called "History", that comes up when I push the "History" button from the main screen. This "History" screen should just have a list of all of what's happened in this app: "Player 1 lost one life." "Player 3 lost four life." and so on.

Note: both files contain the same result. lifecounter2 contains the project using a XIB file.
