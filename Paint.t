% -------------------------
% Paint Program
% Written By - Amit Sarvate
% Date Written - December 2017
%
% Input - User clicks on various button within the Paint GUI via mouse, choosing their tool, colour, and perhaps even the thickness (oonly if free draw is in selection)
	  % User then clicks, drags and releases onto the canvas to draw the shape
	  
% Output - Program outputs the shape drawn by user's mouse movements onto the the cavas
% Processing - Procedures are used to draw the button faces for each button. All together, each button consists of two button faces, one in an upwards position and the other in a downwards position
	       % The 'mousewhere' function is used to detect when the mouse cursor is directly on a specific button.
	       % If the mouse button is pressed whilst the cursor is over a specific button, the button face in downwards position is displayed.
	       % If the mouse button is released whilst the cursor is over a specific button, the button face in upwards position is displayed. This all together gives the button a pressing, 3D like animated appearance
	       % If a certain tool button is clicked, the variable 'ObjectType' is assigned a specific number from 1 to 10
	       % If a certain colour button is clicked from the colour pallette, the variable ColourNum is assigned a specific number, represeting a colour from the turing colour codes
	       % Now if the user clicks into the canvas, the point at which they click becomes the starting point for the drawing of their figure
	       % By holding down the mouse button, dragging the mouse cursor on the canvas, one can adjust the size of their figure//shape. To give the animation of that adjusting of the size, the shape is drawn then erased
	       % When the button is released, the figure//shape is finally drawn to its intended size
	       % The coordinates of that shape are saved in an array and a incremental vairable counting the number of shapes increases by one
	       % A for loop is then used to repeatedly redraw the shapes until all the shapes have been redrawn. This process makes it so that shapes do not erase one another when drawn
	       % If the exit button is pressed a exit ticket variable is assigned a the value two
	       % An exit when command is then used to exit out of the loop when the variable is assigned two which in this case is done by actually pressing the exit button
	       % A Window.Close function is used to terminate the window fully after a delay
	       % If the 'save' button is clicked, the coordinates of the existing shapes are saved into a text file using the open : stream and if the 'load' button is clicked then the coordinates of the shapes are read using a for loop and used to draw the shapes once again 
% -------------------------

% Declaring of Variables and Arrays
var x_mouse, y_mouse, button, oldbutton : int
var ObjectType : int := 0
var ColourNum : int := 7 % Initizaling the original colour to black
var FixedX, FixedY : int
var Radi : int := 2
const up := 0
const down := 1
var font : int
var window : int := Window.Open ("graphics:1200;700")
var e1 : int := 0
var dotx, doty : int
var q, l : int
var shape, x1, y1, x2, y2, clr : array 1 .. 1000 of int
var stream : int

% Output Preferences
setscreen ("graphics:1200;700")

% Background
drawfillbox (0, 0, maxx, maxy, grey)
drawbox (0, 0, maxx, maxy, black)

% Canvas
drawfillbox (125, 50, maxx - 2, maxy - 50, white)
drawbox (125, 50, maxx - 2, maxy - 50, black)

% FUNCTION (SHAPE) BUTTONS -----------------------------------------------------------------------------------------

% 'Drawbox' button faces
procedure drawboxup
    drawbox (12, 600, 62, 650, black)
    drawfillbox (61, 601, 59, 649, 25)
    drawfillbox (61, 601, 13, 603, 25)
    drawfillbox (13, 604, 15, 649, white)
    drawfillbox (13, 649, 58, 647, white)
    drawbox (22, 610, 52, 640, black)
end drawboxup

drawboxup

procedure drawboxdown
    drawbox (12, 600, 62, 650, black)
    drawfillbox (61, 601, 59, 649, white)
    drawfillbox (61, 601, 13, 603, white)
    drawfillbox (13, 604, 15, 649, 25)
    drawfillbox (13, 649, 58, 647, 25)
    drawbox (22, 610, 52, 640, black)
end drawboxdown
% ------------------------------------------

% 'Drawfillbox' button faces
procedure drawfillboxup
    drawbox (62, 600, 112, 650, black)
    drawfillbox (111, 601, 109, 649, 25)
    drawfillbox (109, 601, 63, 603, 25)
    drawfillbox (63, 604, 65, 649, white)
    drawfillbox (65, 649, 108, 647, white)
    drawfillbox (72, 610, 102, 640, black)
end drawfillboxup

drawfillboxup

procedure drawfillboxdown
    drawbox (62, 600, 112, 650, black)
    drawfillbox (111, 601, 109, 649, white)
    drawfillbox (109, 601, 63, 603, white)
    drawfillbox (63, 604, 65, 649, 25)
    drawfillbox (65, 649, 108, 647, 25)
    drawfillbox (72, 610, 102, 640, black)
end drawfillboxdown
% ------------------------------------------

% 'Drawoval' button faces
procedure drawovalup
    drawbox (12, 550, 62, 600, black)
    drawfillbox (61, 551, 59, 599, 25)
    drawfillbox (61, 551, 13, 553, 25)
    drawfillbox (13, 554, 15, 599, white)
    drawfillbox (13, 599, 58, 597, white)
    drawoval (37, 575, 15, 15, black)
end drawovalup

drawovalup

procedure drawovaldown
    drawbox (12, 550, 62, 600, black)
    drawfillbox (61, 551, 59, 599, white)
    drawfillbox (61, 551, 13, 553, white)
    drawfillbox (13, 554, 15, 599, 25)
    drawfillbox (13, 599, 58, 597, 25)
    drawbox (22, 610, 52, 640, black)
    drawoval (37, 575, 15, 15, black)
end drawovaldown
% --------------------------------------------

% 'Drawfilloval button faces
procedure drawfillovalup
    drawbox (62, 550, 112, 600, black)
    drawfillbox (111, 551, 109, 599, 25)
    drawfillbox (109, 551, 63, 553, 25)
    drawfillbox (63, 554, 65, 599, white)
    drawfillbox (65, 599, 108, 597, white)
    drawfilloval (87, 575, 15, 15, black)
end drawfillovalup

drawfillovalup

procedure drawfillovaldown
    drawbox (62, 550, 112, 600, black)
    drawfillbox (111, 551, 109, 599, white)
    drawfillbox (109, 551, 63, 553, white)
    drawfillbox (63, 554, 65, 599, 25)
    drawfillbox (65, 599, 108, 597, 25)
    drawfilloval (87, 575, 15, 15, black)
end drawfillovaldown
% --------------------------------------------

% 'Drawmapleleaf' button faces
procedure drawmapleleafup
    drawbox (12, 500, 62, 550, black)
    drawfillbox (61, 501, 59, 549, 25)
    drawfillbox (61, 501, 13, 503, 25)
    drawfillbox (13, 504, 15, 549, white)
    drawfillbox (13, 549, 58, 547, white)
    drawmapleleaf (22, 510, 52, 540, black)
end drawmapleleafup

drawmapleleafup

procedure drawmapleleafdown
    drawbox (12, 500, 62, 550, black)
    drawfillbox (61, 501, 59, 549, white)
    drawfillbox (61, 501, 13, 503, white)
    drawfillbox (13, 504, 15, 549, 25)
    drawfillbox (13, 549, 58, 547, 25)
    drawmapleleaf (22, 510, 52, 540, black)
end drawmapleleafdown
% --------------------------------------------

% 'Drawfillmapleleaf' button faces
procedure drawfillmapleleafup
    drawbox (62, 500, 112, 550, black)
    drawfillbox (111, 501, 109, 549, 25)
    drawfillbox (109, 501, 63, 503, 25)
    drawfillbox (63, 504, 65, 549, white)
    drawfillbox (65, 549, 108, 547, white)
    drawfillmapleleaf (72, 510, 102, 540, black)

end drawfillmapleleafup

drawfillmapleleafup

procedure drawfillmapleleafdown
    drawbox (62, 500, 112, 550, black)
    drawfillbox (111, 501, 109, 549, white)
    drawfillbox (109, 501, 63, 503, white)
    drawfillbox (63, 504, 65, 549, 25)
    drawfillbox (65, 549, 108, 547, 25)
    drawfillmapleleaf (72, 510, 102, 540, black)

end drawfillmapleleafdown
% -----------------------------------------

% 'Drawline' button faces
procedure drawlineup
    drawbox (12, 450, 62, 500, black)
    drawfillbox (61, 451, 59, 499, 25)
    drawfillbox (61, 451, 13, 453, 25)
    drawfillbox (13, 454, 15, 499, white)
    drawfillbox (13, 499, 58, 497, white)
    drawline (22, 460, 52, 490, black)

end drawlineup

drawlineup

procedure drawlinedown
    drawbox (12, 450, 62, 500, black)
    drawfillbox (61, 451, 59, 499, white)
    drawfillbox (61, 451, 13, 453, white)
    drawfillbox (13, 454, 15, 499, 25)
    drawfillbox (13, 499, 58, 497, 25)
    drawline (22, 460, 52, 490, black)

end drawlinedown
% ------------------------------------------

% 'Eraser' button faces
procedure eraserup
    drawbox (62, 450, 112, 500, black)
    drawfillbox (111, 451, 109, 499, 25)
    drawfillbox (109, 451, 63, 453, 25)
    drawfillbox (63, 454, 65, 499, white)
    drawfillbox (65, 499, 108, 497, white)
    drawfillbox (72, 460, 102, 490, white)
    drawbox (72, 460, 102, 490, black)
end eraserup

eraserup

procedure eraserdown
    drawbox (62, 450, 112, 500, black)
    drawfillbox (111, 451, 109, 499, white)
    drawfillbox (109, 451, 63, 453, white)
    drawfillbox (63, 454, 65, 499, 25)
    drawfillbox (65, 499, 108, 497, 25)
    drawfillbox (72, 460, 102, 490, white)
    drawbox (72, 460, 102, 490, black)
end eraserdown
% -------------------------------------------

% 'Spray Paint' button faces
procedure drawspup
    drawbox (12, 400, 62, 450, black)
    drawfillbox (61, 401, 59, 449, 25)
    drawfillbox (61, 401, 13, 403, 25)
    drawfillbox (13, 404, 15, 449, white)
    drawfillbox (13, 449, 58, 447, white)

end drawspup

drawspup

procedure drawspdown
    drawbox (12, 400, 62, 450, black)
    drawfillbox (61, 401, 59, 449, white)
    drawfillbox (61, 401, 13, 403, white)
    drawfillbox (13, 404, 15, 449, 25)
    drawfillbox (13, 449, 58, 447, 25)
end drawspdown

for i : 1 .. 60
    randint (dotx, 20, 54)
    randint (doty, 410, 440)
    drawdot (dotx, doty, black)
end for

% --------------------------------------------


% 'Free Draw' button faces
procedure freedrawup
    drawbox (62, 400, 112, 450, black)
    drawfillbox (111, 401, 109, 449, 25)
    drawfillbox (109, 401, 63, 403, 25)
    drawfillbox (63, 404, 65, 449, white)
    drawfillbox (65, 449, 108, 447, white)
    drawfilloval (87, 425, 5, 5, black)

end freedrawup

freedrawup

procedure freedrawdown
    drawbox (62, 400, 112, 450, black)
    drawfillbox (111, 401, 109, 449, white)
    drawfillbox (109, 401, 63, 403, white)
    drawfillbox (63, 404, 65, 449, 25)
    drawfillbox (65, 449, 108, 447, 25)
    drawfilloval (87, 425, 5, 5, black)

end freedrawdown
% --------------------------------------------

procedure clsup
    drawbox (12, 350, 62, 400, black)
    drawfillbox (61, 351, 59, 399, 25)
    drawfillbox (61, 351, 13, 353, 25)
    drawfillbox (13, 354, 15, 399, white)
    drawfillbox (13, 399, 58, 397, white)

end clsup

clsup

procedure clsdown
    drawbox (12, 350, 62, 400, black)
    drawfillbox (61, 351, 59, 399, white)
    drawfillbox (61, 351, 13, 353, white)
    drawfillbox (13, 354, 15, 399, 25)
    drawfillbox (13, 399, 58, 397, 25)

end clsdown

% --------------------------------------------------------------------------------------------------------------------------

% THICKNESS ADJUSTMENT BUTTONS ---------------------------------------------------------------------------------------------

% First thickness button faces
procedure firstthickup
    drawbox (12, 300, 112, 325, black)
    drawfillbox (13, 301, 111, 303, 25)
    drawfillbox (111, 301, 109, 324, 25)
    drawfillbox (109, 324, 13, 322, white)
    drawfillbox (13, 324, 15, 303, white)
    drawfillbox (32, 312, 92, 314, black)
end firstthickup

firstthickup

procedure firstthickdown
    drawbox (12, 300, 112, 325, black)
    drawfillbox (13, 301, 111, 303, white)
    drawfillbox (111, 301, 109, 324, white)
    drawfillbox (109, 324, 13, 322, 25)
    drawfillbox (13, 324, 15, 303, 25)
    drawfillbox (32, 312, 92, 314, black)
end firstthickdown
% -------------------------------------------

% Second thickness button faces
procedure secondthickup
    drawbox (12, 275, 112, 300, black)
    drawfillbox (13, 276, 111, 278, 25)
    drawfillbox (111, 278, 109, 299, 25)
    drawfillbox (109, 299, 13, 297, white)
    drawfillbox (13, 299, 15, 278, white)
    drawfillbox (32, 284, 92, 290, black)
end secondthickup

secondthickup

procedure secondthickdown
    drawbox (12, 275, 112, 300, black)
    drawfillbox (13, 276, 111, 278, white)
    drawfillbox (111, 278, 109, 299, white)
    drawfillbox (109, 299, 13, 297, 25)
    drawfillbox (13, 299, 15, 278, 25)
    drawfillbox (32, 284, 92, 290, black)
end secondthickdown
% ---------------------------------------------

% Third thickness button faces
procedure thirdthickup
    drawbox (12, 250, 112, 275, black)
    drawfillbox (13, 251, 111, 253, 25)
    drawfillbox (111, 251, 109, 274, 25)
    drawfillbox (109, 274, 13, 272, white)
    drawfillbox (13, 274, 15, 253, white)
    drawfillbox (32, 258, 92, 267, black)
end thirdthickup

thirdthickup

procedure thirdthickdown
    drawbox (12, 250, 112, 275, black)
    drawfillbox (13, 251, 111, 253, white)
    drawfillbox (111, 251, 109, 274, white)
    drawfillbox (109, 274, 13, 272, 25)
    drawfillbox (13, 274, 15, 253, 25)
    drawfillbox (32, 258, 92, 267, black)
end thirdthickdown
% --------------------------------------------

% Fourth thickness button faces
procedure fourththickup
    drawbox (12, 225, 112, 250, black)
    drawfillbox (13, 226, 111, 228, 25)
    drawfillbox (111, 226, 109, 249, 25)
    drawfillbox (109, 249, 13, 247, white)
    drawfillbox (13, 249, 15, 228, white)
    drawfillbox (32, 230, 92, 245, black)
end fourththickup

fourththickup

procedure fourththickdown
    drawbox (12, 225, 112, 250, black)
    drawfillbox (13, 226, 111, 228, white)
    drawfillbox (111, 226, 109, 249, white)
    drawfillbox (109, 249, 13, 247, 25)
    drawfillbox (13, 249, 15, 228, 25)
    drawfillbox (32, 230, 92, 245, black)
end fourththickdown
% --------------------------------------------

% ----------------------------------------------------------------------------------------------------------------------------------

% COLOUR PALLETTE ------------------------------------------------------------------------------------------------------------------

% White Button
procedure whiteu
    drawbox (125, 10, 155, 40, black)
    drawfillbox (126, 11, 154, 13, 25)
    drawfillbox (154, 11, 152, 39, 25)
    drawfillbox (152, 39, 126, 37, white)
    drawfillbox (126, 39, 128, 13, white)
    drawfillbox (130, 15, 150, 35, white)
end whiteu

whiteu

procedure whited
    drawbox (125, 10, 155, 40, black)
    drawfillbox (126, 11, 154, 13, white)
    drawfillbox (154, 11, 152, 39, white)
    drawfillbox (152, 39, 126, 37, 25)
    drawfillbox (126, 39, 128, 13, 25)
    drawfillbox (130, 15, 150, 35, white)
end whited
% ----------------------------------------

% Dark Blue Button
procedure darkblueu
    drawbox (155, 10, 185, 40, black)
    drawfillbox (156, 11, 184, 13, 25)
    drawfillbox (184, 11, 182, 39, 25)
    drawfillbox (182, 39, 156, 37, white)
    drawfillbox (156, 39, 158, 13, white)
    drawfillbox (160, 15, 180, 35, 1)
end darkblueu

darkblueu

procedure darkblued
    drawbox (155, 10, 185, 40, black)
    drawfillbox (156, 11, 184, 13, white)
    drawfillbox (184, 11, 182, 39, white)
    drawfillbox (182, 39, 156, 37, 25)
    drawfillbox (156, 39, 158, 13, 25)
    drawfillbox (160, 15, 180, 35, 1)
end darkblued
% ----------------------------------------

% Dark Green Button
procedure darkgreenu
    drawbox (185, 10, 215, 40, black)
    drawfillbox (186, 11, 214, 13, 25)
    drawfillbox (214, 11, 212, 39, 25)
    drawfillbox (212, 39, 186, 37, white)
    drawfillbox (186, 39, 188, 13, white)
    drawfillbox (190, 15, 210, 35, 2)
end darkgreenu

darkgreenu

procedure darkgreend
    drawbox (185, 10, 215, 40, black)
    drawfillbox (186, 11, 214, 13, white)
    drawfillbox (214, 11, 212, 39, white)
    drawfillbox (212, 39, 186, 37, 25)
    drawfillbox (186, 39, 188, 13, 25)
    drawfillbox (190, 15, 210, 35, 2)
end darkgreend
% ----------------------------------------

% Cyan Button
procedure cyanu
    drawbox (215, 10, 245, 40, black)
    drawfillbox (216, 11, 244, 13, 25)
    drawfillbox (244, 11, 242, 39, 25)
    drawfillbox (242, 39, 216, 37, white)
    drawfillbox (216, 39, 218, 13, white)
    drawfillbox (220, 15, 240, 35, 3)
end cyanu

cyanu

procedure cyand
    drawbox (215, 10, 245, 40, black)
    drawfillbox (216, 11, 244, 13, white)
    drawfillbox (244, 11, 242, 39, white)
    drawfillbox (242, 39, 216, 37, 25)
    drawfillbox (216, 39, 218, 13, 25)
    drawfillbox (220, 15, 240, 35, 3)
end cyand
% ----------------------------------------

% Maroon Button
procedure maroonu
    drawbox (245, 10, 275, 40, black)
    drawfillbox (246, 11, 274, 13, 25)
    drawfillbox (274, 11, 272, 39, 25)
    drawfillbox (272, 39, 246, 37, white)
    drawfillbox (246, 39, 248, 13, white)
    drawfillbox (250, 15, 270, 35, 4)
end maroonu

maroonu

procedure maroond
    drawbox (245, 10, 275, 40, black)
    drawfillbox (246, 11, 274, 13, white)
    drawfillbox (274, 11, 272, 39, white)
    drawfillbox (272, 39, 246, 37, 25)
    drawfillbox (246, 39, 248, 13, 25)
    drawfillbox (250, 15, 270, 35, 4)
end maroond
% ----------------------------------------

% Purple Button
procedure purpleu
    drawbox (275, 10, 305, 40, black)
    drawfillbox (276, 11, 304, 13, 25)
    drawfillbox (304, 11, 302, 39, 25)
    drawfillbox (302, 39, 276, 37, white)
    drawfillbox (276, 39, 278, 13, white)
    drawfillbox (280, 15, 300, 35, 5)
end purpleu

purpleu

procedure purpled
    drawbox (275, 10, 305, 40, black)
    drawfillbox (276, 11, 304, 13, white)
    drawfillbox (304, 11, 302, 39, white)
    drawfillbox (302, 39, 276, 37, 25)
    drawfillbox (276, 39, 278, 13, 25)
    drawfillbox (280, 15, 300, 35, 5)
end purpled
% ----------------------------------------

% Olive Button
procedure oliveu
    drawbox (305, 10, 335, 40, black)
    drawfillbox (306, 11, 334, 13, 25)
    drawfillbox (334, 11, 332, 39, 25)
    drawfillbox (332, 39, 306, 37, white)
    drawfillbox (306, 39, 308, 13, white)
    drawfillbox (310, 15, 330, 35, 6)
end oliveu

oliveu

procedure olived
    drawbox (305, 10, 335, 40, black)
    drawfillbox (306, 11, 334, 13, white)
    drawfillbox (334, 11, 332, 39, white)
    drawfillbox (332, 39, 306, 37, 25)
    drawfillbox (306, 39, 308, 13, 25)
    drawfillbox (310, 15, 330, 35, 6)
end olived
% ----------------------------------------

% Royal Blue Button
procedure royalblueu
    drawbox (335, 10, 365, 40, black)
    drawfillbox (336, 11, 364, 13, 25)
    drawfillbox (364, 11, 362, 39, 25)
    drawfillbox (362, 39, 336, 37, white)
    drawfillbox (336, 39, 338, 13, white)
    drawfillbox (340, 15, 360, 35, 9)
end royalblueu

royalblueu

procedure royalblued
    drawbox (335, 10, 365, 40, black)
    drawfillbox (336, 11, 364, 13, white)
    drawfillbox (364, 11, 362, 39, white)
    drawfillbox (362, 39, 336, 37, 25)
    drawfillbox (336, 39, 338, 13, 25)
    drawfillbox (340, 15, 360, 35, 9)
end royalblued
% ----------------------------------------

% Lime Green Button
procedure limegreenu
    drawbox (365, 10, 395, 40, black)
    drawfillbox (366, 11, 394, 13, 25)
    drawfillbox (394, 11, 392, 39, 25)
    drawfillbox (392, 39, 366, 37, white)
    drawfillbox (366, 39, 368, 13, white)
    drawfillbox (370, 15, 390, 35, 10)
end limegreenu

limegreenu

procedure limegreend
    drawbox (365, 10, 395, 40, black)
    drawfillbox (366, 11, 394, 13, white)
    drawfillbox (394, 11, 392, 39, white)
    drawfillbox (392, 39, 366, 37, 25)
    drawfillbox (366, 39, 368, 13, 25)
    drawfillbox (370, 15, 390, 35, 10)
end limegreend

% ----------------------------------------

% Red Button
procedure redu
    drawbox (395, 10, 425, 40, black)
    drawfillbox (396, 11, 424, 13, 25)
    drawfillbox (424, 11, 422, 39, 25)
    drawfillbox (422, 39, 396, 37, white)
    drawfillbox (396, 39, 398, 13, white)
    drawfillbox (400, 15, 420, 35, 40)
end redu

redu

procedure redd
    drawbox (395, 10, 425, 40, black)
    drawfillbox (396, 11, 424, 13, white)
    drawfillbox (424, 11, 422, 39, white)
    drawfillbox (422, 39, 396, 37, 25)
    drawfillbox (396, 39, 398, 13, 25)
    drawfillbox (400, 15, 420, 35, 40)
end redd
% ----------------------------------------

% Orange Button
procedure orangeu
    drawbox (425, 10, 455, 40, black)
    drawfillbox (426, 11, 454, 13, 25)
    drawfillbox (454, 11, 452, 39, 25)
    drawfillbox (452, 39, 426, 37, white)
    drawfillbox (426, 39, 428, 13, white)
    drawfillbox (430, 15, 450, 35, 42)
end orangeu

orangeu

procedure oranged
    drawbox (425, 10, 455, 40, black)
    drawfillbox (426, 11, 454, 13, white)
    drawfillbox (454, 11, 452, 39, white)
    drawfillbox (452, 39, 426, 37, 25)
    drawfillbox (426, 39, 428, 13, 25)
    drawfillbox (430, 15, 450, 35, 42)
end oranged
% ----------------------------------------


% Exit Button Faces
procedure exitu
    drawfillbox (maxx - 25, maxy - 25, maxx - 2, maxy - 2, white)
    drawbox (maxx - 25, maxy - 25, maxx - 2, maxy - 2, black)
    drawline (maxx - 20, maxy - 20, maxx - 7, maxy - 7, black)
    drawline (maxx - 7, maxy - 20, maxx - 20, maxy - 7, black)
end exitu

exitu

procedure exitd
    drawfillbox (maxx - 25, maxy - 25, maxx - 2, maxy - 2, 40)
    drawbox (maxx - 25, maxy - 25, maxx - 2, maxy - 2, black)
    drawline (maxx - 20, maxy - 20, maxx - 7, maxy - 7, black)
    drawline (maxx - 7, maxy - 20, maxx - 20, maxy - 7, black)
end exitd
% ---------------------------------------

% Save Button
procedure saveup
    drawbox (12, 50, 112, 90, black)
    drawfillbox (13, 51, 111, 54, 25)
    drawfillbox (111, 51, 108, 89, 25)
    drawfillbox (107, 89, 13, 86, white)
    drawfillbox (13, 89, 16, 55, white)
end saveup

saveup

procedure savedown
    drawbox (12, 50, 112, 90, black)
    drawfillbox (13, 51, 111, 54, white)
    drawfillbox (111, 51, 108, 89, white)
    drawfillbox (107, 89, 13, 86, 25)
    drawfillbox (13, 89, 16, 55, 25)
end savedown

% Load Button
procedure loadup
    drawbox (12, 10, 112, 50, black)
    drawfillbox (13, 11, 111, 14, 25)
    drawfillbox (111, 11, 108, 49, 25)
    drawfillbox (107, 49, 13, 46, white)
    drawfillbox (13, 49, 16, 15, white)
end loadup

loadup

procedure loaddown
    drawbox (12, 10, 112, 50, black)
    drawfillbox (13, 11, 111, 14, white)
    drawfillbox (111, 11, 108, 49, white)
    drawfillbox (107, 49, 13, 46, 25)
    drawfillbox (13, 49, 16, 15, 25)
end loaddown


% ---------------------------------------------------------------------------------------------------------------------------------------

% Initializing Mouse Movement Variables
mousewhere (x_mouse, y_mouse, button)
q := 0

% CLICKING // DRAWING -------------------------------------------------------------------------------------------------------------------
loop

    % Re- Initialzing variables
    oldbutton := button
    mousewhere (x_mouse, y_mouse, button)

    % Font Initization and Text Output
    font := Font.New ("Berlin Sans FB Demi:12")
    Font.Draw ("Colour :", 35, 180, font, 7)
    Font.Draw ("Save", 45, 65, font, 7)
    Font.Draw ("Load", 45, 25, font, 7)
    Font.Draw ("CLS", 25, 370, font, 7)

    % Colour Wheel Indicator
    drawfillbox (32, 120, 82, 170, ColourNum)

    % Redrawing Canvas Boundries
    drawbox (125, 50, maxx - 2, maxy - 50, black)

    % Clicking of drawbox function button
    if x_mouse >= 12 and x_mouse <= 62 and
	    y_mouse >= 600 and y_mouse <= 650 and
	    oldbutton = up and button = down then

	drawboxdown
	ObjectType := 1
    elsif oldbutton = down and button = up then

	drawboxup
    end if
    % ----------------------------------------------

    % Clicking of drawfillbox function button
    if x_mouse >= 62 and x_mouse <= 112 and
	    y_mouse >= 600 and y_mouse <= 650 and
	    oldbutton = up and button = down then

	drawfillboxdown
	ObjectType := 2
    elsif oldbutton = down and button = up then

	drawfillboxup
    end if
    % ----------------------------------------------

    % Clicking of drawcircle function button
    if x_mouse >= 12 and x_mouse <= 62 and
	    y_mouse >= 550 and y_mouse <= 600 and
	    oldbutton = up and button = down then

	drawovaldown
	ObjectType := 3
    elsif oldbutton = down and button = up then

	drawovalup
    end if
    % ----------------------------------------------

    % Clicking of drawfillcircle function button
    if x_mouse >= 62 and x_mouse <= 122 and
	    y_mouse >= 550 and y_mouse <= 600 and
	    oldbutton = up and button = down then

	drawfillovaldown
	ObjectType := 4
    elsif oldbutton = down and button = up then

	drawfillovalup
    end if
    % ----------------------------------------------

    % Clicking of drawmapleleaf function button
    if x_mouse >= 12 and x_mouse <= 62 and
	    y_mouse >= 500 and y_mouse <= 550 and
	    oldbutton = up and button = down then

	drawmapleleafdown
	ObjectType := 5
    elsif oldbutton = down and button = up then

	drawmapleleafup

    end if
    % ----------------------------------------------

    % Clicking of drawfillmapleleaf function button
    if x_mouse >= 62 and x_mouse <= 112 and
	    y_mouse >= 500 and y_mouse <= 550 and
	    oldbutton = up and button = down then

	drawfillmapleleafdown
	ObjectType := 6
    elsif oldbutton = down and button = up then

	drawfillmapleleafup
    end if
    % ----------------------------------------------

    % Clicking of drawline function button
    if x_mouse >= 12 and x_mouse <= 62 and
	    y_mouse >= 450 and y_mouse <= 500 and
	    oldbutton = up and button = down then

	drawlinedown
	ObjectType := 7
    elsif oldbutton = down and button = up then

	drawlineup
    end if
    % ----------------------------------------------

    % Clicking of eraser function button
    if x_mouse >= 62 and x_mouse <= 112 and
	    y_mouse >= 450 and y_mouse <= 500 and
	    oldbutton = up and button = down then

	eraserdown
	ObjectType := 8


    elsif oldbutton = down and button = up then

	eraserup
    end if
    % ----------------------------------------------

    % Clicking of spray paint function button
    if x_mouse >= 12 and x_mouse <= 62 and
	    y_mouse >= 400 and y_mouse <= 450 and
	    oldbutton = up and button = down then

	drawspdown
	ObjectType := 9

    elsif oldbutton = down and button = up then

	drawspup
    end if
    % ----------------------------------------------

    % Clicking of freedraw function button
    if x_mouse >= 62 and x_mouse <= 112 and
	    y_mouse >= 400 and y_mouse <= 450 and
	    oldbutton = up and button = down then

	freedrawdown
	ObjectType := 10

    elsif oldbutton = down and button = up then

	freedrawup
    end if
    % ----------------------------------------------

    % Clicking of the cls function button
    if x_mouse >= 12 and x_mouse <= 62 and
	    y_mouse >= 350 and y_mouse <= 400 and
	    oldbutton = up and button = down then

	clsdown

    elsif x_mouse >= 12 and x_mouse <= 62 and
	    y_mouse >= 350 and y_mouse <= 400 and
	    oldbutton = down and button = up then

	clsup
	for i : 126 .. maxx - 3
	    drawfillbox (127, 52, i, maxy - 52, white)
	    delay (1)
	end for

	q := 0

    end if
    % ------------------------------------------------

    % Clicking on first thickness
    if x_mouse >= 12 and x_mouse <= 112 and
	    y_mouse >= 300 and y_mouse <= 325 and
	    oldbutton = up and button = down then

	firstthickdown
	Radi := 1
    elsif oldbutton = down and button = up then

	firstthickup
    end if
    % ----------------------------------------------

    % Clicking on second thickness
    if x_mouse >= 12 and x_mouse <= 112 and
	    y_mouse >= 275 and y_mouse <= 300 and
	    oldbutton = up and button = down then

	secondthickdown
	Radi := 3
    elsif oldbutton = down and button = up then

	secondthickup

    end if
    % ----------------------------------------------

    % Clicking on third thickness
    if x_mouse >= 12 and x_mouse <= 112 and
	    y_mouse >= 250 and y_mouse <= 275 and
	    oldbutton = up and button = down then

	thirdthickdown
	Radi := 5
    elsif oldbutton = down and button = up then

	thirdthickup
    end if
    % ----------------------------------------------

    % Clicking on fourth thickness
    if x_mouse >= 12 and x_mouse <= 112 and
	    y_mouse >= 225 and y_mouse <= 250 and
	    oldbutton = up and button = down then

	fourththickdown
	Radi := 10
    elsif oldbutton = down and button = up then

	fourththickup

    end if
    % ----------------------------------------------

    % Clicking on the exit button
    if x_mouse >= maxx - 25 and x_mouse <= maxx - 2 and
	    y_mouse >= maxy - 20 and y_mouse <= maxy - 2 and
	    button = down and oldbutton = up then

	exitd
	cls
	e1 := 2
	exit
    elsif oldbutton = down and button = up then
	exitu
    end if
    % ----------------------------------------------

    % Clicking On Colour Pallette  --------------------------------------------

    % Clicking on White Button
    if x_mouse >= 125 and x_mouse <= 155 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 0
	whited

    elsif oldbutton = down and button = up then
	whiteu
    end if
    % ----------------------------------------------

    % Clicking on Dark Blue Button
    if x_mouse >= 155 and x_mouse <= 185 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 1
	darkblued

    elsif oldbutton = down and button = up then

	darkblueu
    end if
    % ----------------------------------------------

    % Clicking on Dark Green Button
    if x_mouse >= 185 and x_mouse <= 215 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 2
	darkgreend

    elsif oldbutton = down and button = up then

	darkgreenu
    end if
    % ----------------------------------------------

    % Clicking on Cyan Button
    if x_mouse >= 215 and x_mouse <= 245 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 3
	cyand

    elsif oldbutton = down and button = up then

	cyanu
    end if
    % ----------------------------------------------

    % Clicking on Maroon Button
    if x_mouse >= 245 and x_mouse <= 275 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 4
	maroond

    elsif oldbutton = down and button = up then

	maroonu
    end if
    % ----------------------------------------------

    % Clicking on Purple Button
    if x_mouse >= 275 and x_mouse <= 305 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 5
	purpled

    elsif oldbutton = down and button = up then

	purpleu
    end if
    % ----------------------------------------------

    % Clicking on Olive Button
    if x_mouse >= 305 and x_mouse <= 335 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 6
	olived

    elsif oldbutton = down and button = up then

	oliveu
    end if
    % ----------------------------------------------

    % Clicking on Royal Blue Button
    if x_mouse >= 335 and x_mouse <= 365 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 9
	royalblued

    elsif oldbutton = down and button = up then

	royalblueu
    end if
    % ----------------------------------------------

    % Clicking on Lime Green Button
    if x_mouse >= 365 and x_mouse <= 395 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 10
	limegreend

    elsif oldbutton = down and button = up then

	limegreenu
    end if
    % ----------------------------------------------

    % Clicking on Red Button
    if x_mouse >= 395 and x_mouse <= 425 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 40
	redd

    elsif oldbutton = down and button = up then

	redu
    end if
    % ----------------------------------------------

    % Clicking on Orange Button
    if x_mouse >= 425 and x_mouse <= 455 and y_mouse >= 10 and y_mouse <= 40
	    and button = down and oldbutton = up then
	ColourNum := 42
	oranged

    elsif oldbutton = down and button = up then

	orangeu
    end if
    % ----------------------------------------------

    % DRAWING OF SHAPES//FIGURES ----------------------------------------------------------------------------------------------------------------------

    % Drawing box
    if ObjectType = 1 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = up then
	    FixedX := x_mouse
	    FixedY := y_mouse
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = down then
	    drawbox (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	    delay (15)
	    drawbox (FixedX, FixedY, x_mouse, y_mouse, white)
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and oldbutton = down and button = up then
	    drawbox (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	end if
    end if
    % ----------------------------------------------

    % Drawing filled box
    if ObjectType = 2 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = up then
	    FixedX := x_mouse
	    FixedY := y_mouse
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = down then
	    drawfillbox (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	    delay (15)
	    drawfillbox (FixedX, FixedY, x_mouse, y_mouse, white)
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and oldbutton = down and button = up then
	    drawfillbox (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	end if
    end if
    % ----------------------------------------------

    % Drawing oval (circle)
    if ObjectType = 3 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = up then
	    FixedX := x_mouse
	    FixedY := y_mouse
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = down then
	    drawoval ((FixedX + x_mouse) div 2, (FixedY + y_mouse) div 2, abs (x_mouse - FixedX) div 2, abs (y_mouse - FixedY) div 2, ColourNum)
	    delay (15)
	    drawoval ((FixedX + x_mouse) div 2, (FixedY + y_mouse) div 2, abs (x_mouse - FixedX) div 2, abs (y_mouse - FixedY) div 2, white)
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and oldbutton = down and button = up then
	    drawoval ((FixedX + x_mouse) div 2, (FixedY + y_mouse) div 2, abs (x_mouse - FixedX) div 2, abs (y_mouse - FixedY) div 2, ColourNum)
	end if
    end if
    % ----------------------------------------------

    % Drawing filled oval (circle)
    if ObjectType = 4 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = up then
	    FixedX := x_mouse
	    FixedY := y_mouse
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = down then
	    drawfilloval ((FixedX + x_mouse) div 2, (FixedY + y_mouse) div 2, abs (x_mouse - FixedX) div 2, abs (y_mouse - FixedY) div 2, ColourNum)
	    delay (15)
	    drawfilloval ((FixedX + x_mouse) div 2, (FixedY + y_mouse) div 2, abs (x_mouse - FixedX) div 2, abs (y_mouse - FixedY) div 2, white)
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and oldbutton = down and button = up then
	    drawfilloval ((FixedX + x_mouse) div 2, (FixedY + y_mouse) div 2, abs (x_mouse - FixedX) div 2, abs (y_mouse - FixedY) div 2, ColourNum)
	end if
    end if
    % ----------------------------------------------

    % Drawing mapleleaf
    if ObjectType = 5 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = up then
	    FixedX := x_mouse
	    FixedY := y_mouse
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = down then
	    drawmapleleaf (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	    delay (15)
	    drawmapleleaf (FixedX, FixedY, x_mouse, y_mouse, white)
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and oldbutton = down and button = up then
	    drawmapleleaf (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	end if
    end if
    % ----------------------------------------------

    % Drawing filled mapleleaf
    if ObjectType = 6 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = up then
	    FixedX := x_mouse
	    FixedY := y_mouse
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = down then
	    drawfillmapleleaf (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	    delay (15)
	    drawfillmapleleaf (FixedX, FixedY, x_mouse, y_mouse, white)
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and oldbutton = down and button = up then
	    drawfillmapleleaf (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	end if
    end if
    % ----------------------------------------------

    % Drawing line
    if ObjectType = 7 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = up then
	    FixedX := x_mouse
	    FixedY := y_mouse
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = down then
	    drawline (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	    delay (15)
	    drawline (FixedX, FixedY, x_mouse, y_mouse, white)
	elsif x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and oldbutton = down and button = up then
	    drawline (FixedX, FixedY, x_mouse, y_mouse, ColourNum)
	end if
    end if
    % ----------------------------------------------
    
    % Drawing eraser
    if ObjectType = 8 then

	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down then
	    drawfilloval (x_mouse, y_mouse, 15, 15, white)
	end if
    end if
    % -----------------------------------------------

    % Spray paint
    if ObjectType = 9 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down and oldbutton = down then
	    for i : 1 .. 10

		% Generating dots in range of 15 pixels ahead or behind X of mouse
		randint (dotx, x_mouse - 15, x_mouse + 15)
		randint (doty, y_mouse - 15, y_mouse + 15)
		drawdot (dotx, doty, ColourNum)
		delay (1)
	    end for
	end if
    end if
    % ----------------------------------------------

    % Drawing free draw
    if ObjectType = 10 then
	if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50 and button = down then
	    drawfilloval (x_mouse, y_mouse, Radi, Radi, ColourNum)
	end if
    end if
    % ----------------------------------------------

    % Saving Pic (clicking on SAVE BUTTON)
    if x_mouse >= 12 and x_mouse <= 112 and y_mouse >= 50 and y_mouse <= 90
	    and button = down and oldbutton = up then
	savedown

	% Opening text file for saving
	open : stream, "paintcoord.txt", put

	% Saving coordinates of all shapes into the textfile
	for i : 1 .. q
	    put : stream, shape (i), " ", x1 (i), " ", y1 (i), " ", x2 (i), " ", y2 (i), " ", clr (i)
	end for

	% Saving file
	close : stream

    elsif button = up and oldbutton = down then
	saveup

    end if
    % ----------------------------------------------

    % Loading Pic (clicking on LOAD BUTTON)
    if x_mouse >= 12 and x_mouse <= 112 and y_mouse >= 10 and y_mouse <= 50
	    and button = down and oldbutton = up then
	loaddown

	% Opening text file for saving
	open : stream, "paintcoord.txt", get

	% Intializing variable
	l := q

	% Reading the coordinates of each shape until no coordinates left
	loop

	    exit when eof (stream)

	    l := l + 1
	    get : stream, shape (l)
	    get : stream, x1 (l)
	    get : stream, y1 (l)
	    get : stream, x2 (l)
	    get : stream, y2 (l)
	    get : stream, clr (l)

	end loop

	% Updating counter variable that counts the number of shapes drawn
	q := l

	% Redrawing the shapes
	for i : 1 .. l
	    if shape (i) = 1 then
		drawbox (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
	    elsif shape (i) = 2 then
		drawfillbox (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
	    elsif shape (i) = 3 then
		drawoval ((x1 (i) + x2 (i)) div 2, (y1 (i) + y2 (i)) div 2, abs (x2 (i) - x1 (i)) div 2, abs (y2 (i) - y1 (i)) div 2, clr (i))
	    elsif shape (i) = 4 then
		drawfilloval ((x1 (i) + x2 (i)) div 2, (y1 (i) + y2 (i)) div 2, abs (x2 (i) - x1 (i)) div 2, abs (y2 (i) - y1 (i)) div 2, clr (i))
	    elsif shape (i) = 5 then
		drawmapleleaf (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
	    elsif shape (i) = 6 then
		drawfillmapleleaf (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
	    elsif shape (i) = 7 then
		drawline (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
	    end if
	end for

	% Saving the file
	close : stream

    elsif button = up and oldbutton = down then
	loadup

    end if
    % ----------------------------------------------



    % Incremental increase counting number of shapes drawn every time user releases on canvas
    if x_mouse >= 125 and x_mouse <= maxx - 2 and y_mouse >= 50 and y_mouse <= maxy - 50
	    and oldbutton = down and button = up then

	if ObjectType < 8 then
	    q := q + 1
	end if

	% Identifying specific shape
	if ObjectType = 1 then
	    shape (q) := 1
	elsif ObjectType = 2 then
	    shape (q) := 2
	elsif ObjectType = 3 then
	    shape (q) := 3
	elsif ObjectType = 4 then
	    shape (q) := 4
	elsif ObjectType = 5 then
	    shape (q) := 5
	elsif ObjectType = 6 then
	    shape (q) := 6
	elsif ObjectType = 7 then
	    shape (q) := 7
	end if

	% Storing coordinates of shape in an array
	if ObjectType not= 10 and ObjectType not= 9 and ObjectType not= 8 then
	    x1 (q) := FixedX
	    y1 (q) := FixedY
	    x2 (q) := x_mouse
	    y2 (q) := y_mouse
	    clr (q) := ColourNum
	end if

	% Redrawing shapes
	if ObjectType not= 10 and ObjectType not= 9 and ObjectType not= 8 and q > 1 then
	    for i : 1 .. q

		if shape (i) = 1 then
		    drawbox (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
		elsif shape (i) = 2 then
		    drawfillbox (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
		elsif shape (i) = 3 then
		    drawoval ((x1 (i) + x2 (i)) div 2, (y1 (i) + y2 (i)) div 2, abs (x2 (i) - x1 (i)) div 2, abs (y2 (i) - y1 (i)) div 2, clr (i))
		elsif shape (i) = 4 then
		    drawfilloval ((x1 (i) + x2 (i)) div 2, (y1 (i) + y2 (i)) div 2, abs (x2 (i) - x1 (i)) div 2, abs (y2 (i) - y1 (i)) div 2, clr (i))
		elsif shape (i) = 5 then
		    drawmapleleaf (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
		elsif shape (i) = 6 then
		    drawfillmapleleaf (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
		elsif shape (i) = 7 then
		    drawline (x1 (i), y1 (i), x2 (i), y2 (i), clr (i))
		end if
	    end for
	end if
    end if

    % Condition that must be met by clicking exit button to terminate window
    exit when e1 = 2

end loop
% ---------------------------------------------------------------------------------------------------------------------------------------------------

% Termination of window once loop is exited
delay (1)
Window.Close (window)
