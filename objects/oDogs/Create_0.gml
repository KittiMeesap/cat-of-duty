event_inherited();
spd = 0;
chaseSpd = 0.5;
dir = 0;
xspd = 0;
yspd = 0;

face = 1;

state = 1;

fadeSpd = 1/15;
emergeSpd = .25;

cooldownTime = 4*60;
shootTimer = irandom(cooldownTime);
windupTime = 60;
recoverTime = 45;
bulletInst = noone;

bulletXoff = 5;
bulletYoff = -8;