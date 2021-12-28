victim(mr_boddy).
victim(cook).
victim(motorist).
victim(police_officer).
victim(yvette).
victim(singing_telegram).

suspect(professor_plum).
suspect(mrs_peacock).
suspect(mrs_white).
suspect(miss_scarlet).
suspect(colonel_mustard).
suspect(mr_green).
suspect(wadsworth).

weapon(wrench).
weapon(candlestick).
weapon(lead_pipe).
weapon(knife).
weapon(revolver).
weapon(rope).

room(hall).
room(kitchen).
room(lounge).
room(library).
room(billiard_room).

murder(mr_boddy,candlestick,hall).
murder(cook,knife,kitchen).
murder(motorist,wrench,lounge).
murder(police_officer,lead_pipe,library).
murder(singing_telegram,revolver,hall).
murder(yvette,rope,billiard_room).

% List of motives.
motive(mr_boddy, S) :- S \= wadsworth.
motive(cook, mrs_peacock).
motive(motorist, colonel_mustard).
motive(yvette, miss_scarlet).
motive(yvette, colonel_mustard).
motive(yvette, mrs_white).
motive(police_officer, miss_scarlet).
motive(singing_telegram, professor_plum).
motive(singing_telegram, wadsworth).

% Weapons the suspects could not have used.
impossible_weapon(colonel_mustard, rope).
impossible_weapon(professor_plum, revolver).
impossible_weapon(mrs_peacock, candlestick).

% Rooms the suspects could not have entered.
impossible_room(miss_scarlet, billiard_room).
impossible_room(professor_plum, kitchen).
impossible_room(colonel_mustard, R) :- murder(mr_boddy, W, R).

% List of alibis.
alibi(mr_boddy, mrs_white).
alibi(V, mr_green).
alibi(V, miss_scarlet) :- murder(V, W, R), murder(V2, revolver, R).

% Update accuse to solve the murders.
% Add more facts and rules as needed.
accuse(V,S) :- murder(V,W,R), suspect(S), motive(V,S), not(impossible_weapon(S,W)), not(impossible_room(S,R)), not(alibi(V,S)).
