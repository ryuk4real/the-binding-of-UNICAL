% COLLECTIBLE TYPES
% 0 = MEDIKIT
% 1 = BANDAGES
% 2 = SPEED_UP
% 3 = SHOT_SPEED_UP
% 4 = SHOT_RATE_UP
% 5 = DAMAGE_UP
% 999 = NONE

#const none = 999.
#const medikit = 0.
#const bandages = 1.
#const speed_up = 2.
#const shot_speed_up = 3.
#const shot_rate_up = 4.
#const damage_up = 5.

#const multiplier = 3.

% Calculate health percentage for healing collectibles and powerups
stat_percentage(hp, PERCENTAGE) :-
    player_stat(current_hp, CURRENT_HP),
    player_stat(max_hp, MAX_HP),
    PERCENTAGE = (CURRENT_HP * 100) / MAX_HP.

stat_percentage(speed, PERCENTAGE) :-
    player_stat(speed, SPEED),
    player_stat(max_speed, MAX_SPEED),
    PERCENTAGE = (SPEED * 100) / MAX_SPEED.

stat_percentage(shot_speed, PERCENTAGE) :-
    player_stat(shot_speed, SHOT_SPEED),
    player_stat(max_shot_speed, MAX_SHOT_SPEED),
    PERCENTAGE = (SHOT_SPEED * 100) / MAX_SHOT_SPEED.

stat_percentage(shot_rate, PERCENTAGE) :-
    player_stat(shot_rate, SHOT_RATE),
    player_stat(min_shot_rate, MIN_SHOT_RATE),
    PERCENTAGE = 100 - ((SHOT_RATE - MIN_SHOT_RATE) * 100) / (10 - MIN_SHOT_RATE).

stat_percentage(damage, PERCENTAGE) :-
    player_stat(damage, DAMAGE),
    player_stat(max_damage, MAX_DAMAGE),
    PERCENTAGE = (DAMAGE * 100) / MAX_DAMAGE.

% Stat-based weights (higher stat = higher chance for others)
item_weights(MEDIKIT_BONUS, BANDAGES_BONUS, SPEED_BONUS * multiplier, SHOT_SPEED_BONUS * multiplier, SHOT_RATE_BONUS * multiplier, DAMAGE_BONUS * multiplier) :-
    stat_percentage(hp, HEALTH_PERCENTAGE),
    stat_percentage(speed, SPEED_PERCENTAGE),
    stat_percentage(shot_speed, SHOT_SPEED_PERCENTAGE),
    stat_percentage(shot_rate, SHOT_RATE_PERCENTAGE),
    stat_percentage(damage, DAMAGE_PERCENTAGE),

    MEDIKIT_BONUS = #count { 1 :
        HEALTH_PERCENTAGE <= 25
    },

    BANDAGES_BONUS = #count { 1 :
        HEALTH_PERCENTAGE <= 50
    },
    
    SPEED_BONUS = #count { 1 : 
        SHOT_SPEED_PERCENTAGE > 50, 
        SHOT_RATE_PERCENTAGE > 50,
        DAMAGE_PERCENTAGE > 50,
        HEALTH_PERCENTAGE > 50
    },
    
    SHOT_SPEED_BONUS = #count { 1 : 
        SPEED_PERCENTAGE > 50,
        SHOT_RATE_PERCENTAGE > 50,
        DAMAGE_PERCENTAGE > 50,
        HEALTH_PERCENTAGE > 50
    },
    
    SHOT_RATE_BONUS = #count { 1 :
        SPEED_PERCENTAGE > 50,
        SHOT_SPEED_PERCENTAGE > 50,
        DAMAGE_PERCENTAGE > 50,
        HEALTH_PERCENTAGE > 50
    },
    
    DAMAGE_BONUS = #count { 1 : 
        SPEED_PERCENTAGE > 50,
        SHOT_SPEED_PERCENTAGE > 50,
        SHOT_RATE_PERCENTAGE > 50,
        HEALTH_PERCENTAGE > 50
    }.

% Default distribution if collectible types have not been counted yet
collectible_type(X) :-
    X = @delta((
        (none, 4),
        (medikit, 2),
        (bandages, 3),
        (speed_up, 1),
        (shot_speed_up, 1),
        (shot_rate_up, 1),
        (damage_up, 1)
    )),
    not item_weights(_, _, _, _, _, _).

% If collectible types have been counted, I apply a weighted distribution where the probability of having a collectible
%  of a certain type increases where the corresponding stat is lower
collectible_type(X) :-
    item_weights(W1, W2, W3, W4, W5, W6),
    X = @delta((
        (none, 4),
        (medikit, 2 + W1),
        (bandages, 3 + W2),
        (speed_up, 1 + W3),
        (shot_speed_up, 1 + W4),
        (shot_rate_up, 1 + W5),
        (damage_up, 1 + W6)
    )).

#show collectible_type/1.

% player_stat(STAT_ID, AMOUNT)
% player_stat(damage, 100).
% player_stat(max_damage, 100).
% player_stat(shot_speed, 200).
% player_stat(max_shot_speed, 200).
% player_stat(shot_rate, 1).
% player_stat(min_shot_rate, 1).
% player_stat(speed, 150).
% player_stat(max_speed, 150).
% player_stat(current_hp, 51).
% player_stat(max_hp, 100).

% #show stat_percentage/2.
% #show item_weights/6.