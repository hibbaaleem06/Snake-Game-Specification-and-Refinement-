MACHINE SnakeGame

SETS
    Direction = {UP, DOWN, LEFT, RIGHT}
  
    
VARIABLES
    snake_segments ,  snake_direction,  food_position ,  game_over ,up,yyy,xxx , Calculate_NewHead_Position
   
INVARIANT
     snake_segments = []


INITIALISATION
    snake_segments := [] ||
   
    food_position := (0, 0) ||
    game_over := BOOL ||
    game_over := FALSE ||
  
    snake_direction := RIGHT ||
  yyy := 10 ||
    xxx := 10 
OPERATIONS
    
     moveSnake(ms) =

        PRE
            ¬game_over
        THEN
            LET
                new_head_position BE new_head_position = CalculateNewHeadPosition
            IN
                snake_segments := [new_head_position] 
            END

  END;
  
   
        GenerateFood(gf) =
       
            LET
                new_food_position BE new_food_position = RandomPosition
            IN
                IF new_food_position : snake_segments
                THEN
                    GenerateFood(gf)
                ELSE
                    food_position := new_food_position
                END
        END;
  
   EatFood(ef) = 
    LET 
      new_head_position BE new_head_position = CalculateNewHeadPosition
    IN
      snake_segments := [new_head_position] ^ snake_segments
    END;
  
  
  Calculate_NewHead_Position(np) =
        LET
            
            current_head_position BE  current_head_position = snake_segments(1)
         
          
        IN
            CASE snake_direction OF
                EITHER UP    -> (xxx, yyy + 1)
              | DOWN  -> (xxx, yyy - 1)
              | LEFT  -> (xxx- 1, yyy)
              | RIGHT ->(xxx + 1, yyy)
           
       THEN 
           true
           END
 
 END
 
  END
  END