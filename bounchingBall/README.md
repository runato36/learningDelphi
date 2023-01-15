Problem Description:

This program demonstrates moving graphics by letting you drop a ball and watching it bounce.  

Background & Techniques
First a little physics - gravity makes everything speed up at the same rate.  
This means that each second, the speed of something falling increases by the same amount over its speed in the previous second 
(except feathers and parachutes, but that's a different story).   In our real world, the speed increase (called acceleration)  
is about 32 ft/sec each second.  (This is usually written as 32 ft/sec/sec or 32 ft/sec2.)    

In our virtual "bouncing ball world", real gravity doesn't matter much, so I chose to increase velocity by 1 pixel each time 
through the loop (i.e. acceleration = 1 pixel/loop/loop).  Pixels replace feet and loops replace seconds.  We'll  treat each 
time through the loop as one time interval.  So the first thing we have to do when the user presses the start button is begin 
changing the top property of our ball by V pixels each time through the loop.   V is 0 the first time, 1 the second time, etc.  
Besides changing the velocity, the loop must also detect when the ball hits the floor and reverse direction.  

The other bit of physics is how bouncy the ball is - called the coefficient of elasticity.   It  reflects how much energy is 
lost when the ball bounces.  When the bottom of the ball (there is no bottom property - it's just top + height), I just multiply 
the final speed of the ball, V,  by this ratio (a number between 0 and 1) and change its sign, to make the ball start moving up.  
Moving up, the speed reverses itself automatically at the top of the bounce  since we're adding +1 to a negative velocity number
each time through the loop.   Sooner or later the velocity goes positive and we start  moving down again.      
