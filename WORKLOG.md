# Work Log

## Allison

### 5/22 & 5/23

Resolved issues with git and branching

### 5/24

Set up the Score class

### 5/25

Wrote calculatePoints and calculateCombo

### 5/28

Fixed compile erorrs in Score

### 5/29

Reconciled differences between Circles and Score by updating the getTime method and reworking score calculations

### 5/30 & 5/31

Edited the score class so that it could be used and referenced in the Main class

### 6/1

Edited the score methods, created displayScore and displayCombo, and worked on bomb objects.

### 6/5 & 6/6

Made score more accurate to match frame rate & edited bomb objects

### 6/8

Fixed the scoring of bombs and combo counter

### 6/9

Made negative scoring and worked on spinners

### 6/10 & 6/11

Worked on sliders—moving along horizontal, semicircular, and curved paths, the homepage, and different maps.

## Bingde

### 5-22&&5-23

Fixed errors on branching and other git issues

### 5-24

Worked on the Circles class, have some issues with approaching circles but at least they are generated

### 5-25

Continued the work on the Circles class methods, had some new ideas to replace original methods


### 5-28

attempted at fixing the issue for clicking a single circle object


### 5-29

Fixed mouseClicked() so that circles will disappear after being hit

### 5-30

Included an arraylist for map, involving more circle objects to show up
Attempted audio
Solved the issue of cover() overlapping circles showing up later
Restricted the amount of circles showing up to 3 at a time

### 5-31

Updated background and made sure it run smoothly

### 6-1

Resized the background to fit smaller screens

### 6-6

Revised the testing map

### 6-7

Updated the combo method in main.
Created combo colors

### 6-8

Deleted some methods in circles class and started implementing sliders


### 6-9

Updated sliders so that it is ready for scores.


### 6-11

Implemented spinners
Created maps
Made sure all maps work

## Working features
* circle, spinner, and slider objects
* sliders do not give points until the approaching circle meets the inner one
* once you fall off the slider, you can't get any more points from it
* map selection
* score counter
* right and left tap counter
* sound
* combo counter

## Broken features/bugs
* each map ends with circle that repeatedly calls playNote() & adds score to avoid the array index out of bounds error
* not a bug but could be confusing, some maps start with circle objects that are not numbered starting at 1, this is just how we made the map

## Content resources
* Processing reference
