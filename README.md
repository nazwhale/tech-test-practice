# tic-tac-toe

## The brief

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

Build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.

## My plan

I started by diagramming what classes I would have, and arrived at one for the Board, one for the Game, and one for the Player.

I imagined what the board would look like in my code and came up with a 3 dimensional array of zeros.

```
[[0,0,0],[0,0,0],[0,0,0]]
```
I thought it I would be able to update the zeros to 1's or 2's  depending on the player number. Then, determining a win would be a matter of checking if there were matching numbers above zero along the vertical, horizontal, and diagonal axis'.

I decided that designing the mechanics of the game would be a good place to start. This involved creating a board, initialising one for each new game, and updating the board array with each subsequent move.

Then, I needed to ensure that a move couldn't be made on a square that was already taken.

After that was completed I would tackle the win calculator.
