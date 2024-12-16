INSERT INTO Stadium (StadiumName, NoiseLevel, AvgAttendance, Capacity, City, State, TicketRevenue)
VALUES ('Madison Square Garden', 95, 19800, 20500, 'New York', 'NY', 5000000.00);

INSERT INTO Stadium (StadiumName, NoiseLevel, AvgAttendance, Capacity, City, State, TicketRevenue)
VALUES ('Staples Center', 90, 19000, 21000, 'Los Angeles', 'CA', 4800000.00);

INSERT INTO Team (TeamName, TeamCity, TeamCoach, StadiumID)
VALUES ('New York Knicks', 'New York', 'Tom Thibodeau', 1);

INSERT INTO Team (TeamName, TeamCity, TeamCoach, StadiumID)
VALUES ('Los Angeles Lakers', 'Los Angeles', 'Darvin Ham', 2);

INSERT INTO Team_Historical_Data (TeamID, AllTimeWins, AllTimeLoses)
VALUES (100, 2800, 2600);

INSERT INTO Team_Historical_Data (TeamID, AllTimeWins, AllTimeLoses)
VALUES (101, 3200, 2400);

INSERT INTO player (PlayerName, PlayerPosition, PlayerWeight, PlayerHeight, PlayerNationality)
VALUES ('Charlie Morgan', 'Guard', 150, '6-5', 'USA');

INSERT INTO player (PlayerName, PlayerPosition, PlayerWeight, PlayerHeight, PlayerNationality)
VALUES ('Alex Johnson', 'Forward', 210, '6-8', 'Canada');

INSERT INTO player_season_stats (
    SeasonId, PlayerId, BlocksPerGame, PointsPerGame, AssistsPerGame, ReboundsPerGame,
    FreeThrowPercentage, ThreePointPercentage, FieldGoalPercentage
) VALUES ('2023-2024', 1, 0.8, 25.4, 5.6, 7.8, 85.3, 40.2, 48.5);

INSERT INTO player_season_stats (
    SeasonId, PlayerId, BlocksPerGame, PointsPerGame, AssistsPerGame, ReboundsPerGame,
    FreeThrowPercentage, ThreePointPercentage, FieldGoalPercentage
) VALUES ('2024-2025', 2, 1.2, 18.7, 4.3, 9.1, 78.5, 35.7, 50.2);

INSERT INTO player_historical_stats (
    PlayerId, CareerRebounds, CareerAssists, CareerPoints, CareerBlocks, CareerSteals, CareerGamesPlayed
) VALUES (1, 5000, 4000, 20000, 800, 1500, 800);

INSERT INTO player_historical_stats (
    PlayerId, CareerRebounds, CareerAssists, CareerPoints, CareerBlocks, CareerSteals, CareerGamesPlayed
) VALUES (2, 3200, 2800, 15000, 500, 900, 600);

INSERT INTO player_injury_records(InjuryType, RecurrenceRate, GamesMissed, RecoveryDate, InjuryStartDate, PlayerId)
VALUES ('Hamstring Strain', 30.5, 12, TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-10-01', 'YYYY-MM-DD'), 1);

INSERT INTO player_injury_records(InjuryType, RecurrenceRate, GamesMissed, RecoveryDate, InjuryStartDate, PlayerId)
VALUES ('ACL Tear', 25.0, 30, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), 2);

INSERT INTO Game (GameDate, StartTime, StadiumID)
VALUES (DATE '2024-12-01', TO_TIMESTAMP('2024-11-19 20:20:00', 'YYYY-MM-DD HH24:MI:SS'), 1); 

INSERT INTO Game (GameDate, StartTime, StadiumID)
VALUES (DATE '2024-12-25', TO_TIMESTAMP('2024-11-19 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);

INSERT INTO Team_Season_Stats (TeamID, SeasonWins, SeasonLosses, AvgPoints, AvgPointsAllowed)
VALUES (100, 45, 37, 110.5, 108.3);

INSERT INTO Team_Season_Stats (TeamID, SeasonWins, SeasonLosses, AvgPoints, AvgPointsAllowed)
VALUES (101, 50, 32, 115.2, 107.8);

INSERT INTO Championship_Year (ChampionshipYear, TeamID)
VALUES (1973, 101);

INSERT INTO Championship_Year (ChampionshipYear, TeamID)
VALUES (2020, 100);

INSERT INTO Trade_Record (ReceivingTeam, LosingTeam, PlayerLost, PlayerGained, DraftPickReceived, DraftPickLost, DateOfTrade)
VALUES (100, 101, 1, 2, '2025 First Round Pick', '2023 Second Round Pick', DATE '2023-06-15');

INSERT INTO Trade_Record (ReceivingTeam, LosingTeam, PlayerLost, PlayerGained, DraftPickReceived, DraftPickLost, DateOfTrade)
VALUES (101, 100, 2, 1, NULL, '2024 First Round Pick', DATE '2023-07-01');

INSERT INTO Player_plays_in (GameID, PlayerID, Points, Blocks, Steals, Assists)
VALUES (1, 1, 20, 2, 1, 5);

INSERT INTO Player_plays_in (GameID, PlayerID, Points, Blocks, Steals, Assists)
VALUES (2, 2, 18, 3, 2, 4);

INSERT INTO Team_plays_in (GameID, TeamID, Score, WinStatus, HomeGameStatus)
VALUES (1, 100, 110, 1, 1);

INSERT INTO Team_plays_in (GameID, TeamID, Score, WinStatus, HomeGameStatus)
VALUES (1, 101, 102, 0, 0);

COMMIT;