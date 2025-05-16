# Jogo da velha
### Projeto em Ruby para a cadeira de Paradigmas de Linguagens de Programação

## Prompts usados no ChatGPT
1 - 
Hi, can you please generate the code for a game of tic-tac-toe in ruby? We need:

A board in the terminal, with coordinates, something like this:
   A   B   C
1     |    | 
  ---|---|---
2     |    |
  ---|---|---
3     |    |

A way to get input from two players
A way to check if one of the players has won (I thought of something like this:
after every round after the first one, check if any of the lines, columns or diagonals are filled with the same symbol. on the second to last round, when there's only one space left to be filled, check if it's possible for someone to still win. if it is, keep the game going so the last person can play. if not, declare 'VELHA'.)
thanks!

2 - 
Can you please add a points system and a way of asking the player if they want to play again? So if they do, you change the score and reset the board
