# 50.002-1D-GAME

Dated: Wednesday 20th November 2020

    things that work & dont work (this is a comment in game_beta.luc)
    1. pointer increase to 10 then game over 
    2. shifting R0,R1,R2 content and adding based on generated bits
    3. updating random register from generated random bits
    4. score & difficulty relationship (hard coded several score inputs)
    5. (now testing) red,green,blue button input corresponding to pointer (trying with red now first)
    5.1 correct button input reduces pointer, BUT DOESNT REMOVE Rx bits. (edit in regfile)
    5.2 masking works, but does not reduce color corresponding to button press (UPDATE MASK TABLES OR SOMTHING IDK)
    6 score on 7 segment works 
    
check game_beta.luc for more information


