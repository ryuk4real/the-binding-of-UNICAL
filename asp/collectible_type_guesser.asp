% COLLECTIBLE TYPES
% 0 = MEDIKIT
% 1 = BANDAGES
% 2 = SPEED_UP
% 3 = SHOT_SPEED_UP
% 4 = SHOT_RATE_UP
% 5 = DAMAGE_UP
% 999 = NONE

% x0 = NONE
% x1 = MEDIKIT
% x2 = BANDAGES
% x3 = SPEED_UP
% x4 = SHOT_SPEED_UP
% x5 = SHOT_RATE_UP
% x6 = DAMAGE_UP

#const none = 999.
#const medikit = 0.
#const bandages = 1.
#const speed_up = 2.
#const shot_speed_up = 3.
#const shot_rate_up = 4.
#const damage_up = 5.

#const collectible_type_distribution = (
    (none, 4),
    (medikit, 1),
    (bandages, 3),
    (speed_up, 1),
    (shot_speed_up, 1),
    (shot_rate_up, 1),
    (damage_up, 1)).

collectible_type(X) :- X = @delta(collectible_type_distribution).

#show collectible_type/1.

% player_stat(STAT_ID, AMOUNT)