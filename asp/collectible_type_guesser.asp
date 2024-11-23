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
stat_percentage(hp, Percentage) :-
    player_stat(current_hp, CurrentHP),
    player_stat(max_hp, MaxHP),
    Percentage = (CurrentHP * 100) / MaxHP.

stat_percentage(speed, Percentage) :-
    player_stat(speed, Speed),
    player_stat(max_speed, MaxSpeed),
    Percentage = (Speed * 100) / MaxSpeed.

stat_percentage(shot_speed, Percentage) :-
    player_stat(shot_speed, ShotSpeed),
    player_stat(max_shot_speed, MaxShotSpeed),
    Percentage = (ShotSpeed * 100) / MaxShotSpeed.

stat_percentage(shot_rate, Percentage) :-
    player_stat(shot_rate, ShotRate),
    player_stat(min_shot_rate, MinShotRate),
    Percentage = 100 - ((ShotRate - MinShotRate) * 100) / (10 - MinShotRate).

stat_percentage(damage, Percentage) :-
    player_stat(damage, Damage),
    player_stat(max_damage, MaxDamage),
    Percentage = (Damage * 100) / MaxDamage.

% Stat-based weights (higher stat = higher chance for others)
item_weights(MedikitBonus, BandagesBonus, SpeedBonus * multiplier, ShotSpeedBonus * multiplier, ShotRateBonus * multiplier, DamageBonus * multiplier) :-
    stat_percentage(hp, HealthPerc),
    stat_percentage(speed, SpeedPerc),
    stat_percentage(shot_speed, ShotSpeedPerc),
    stat_percentage(shot_rate, ShotRatePerc),
    stat_percentage(damage, DamagePerc),

    MedikitBonus = #count { 1 :
        HealthPerc <= 25
    },

    BandagesBonus = #count { 1 :
        HealthPerc <= 50
    },
    
    SpeedBonus = #count { 1 : 
        ShotSpeedPerc > 75, 
        ShotRatePerc > 75,
        DamagePerc > 75,
        HealthPerc > 50
    },
    
    ShotSpeedBonus = #count { 1 : 
        SpeedPerc > 75,
        ShotRatePerc > 75,
        DamagePerc > 75,
        HealthPerc > 50
    },
    
    ShotRateBonus = #count { 1 :
        SpeedPerc > 75,
        ShotSpeedPerc > 75,
        DamagePerc > 75,
        HealthPerc > 50
    },
    
    DamageBonus = #count { 1 : 
        SpeedPerc > 75,
        ShotSpeedPerc > 75,
        ShotRatePerc > 75,
        HealthPerc > 50
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