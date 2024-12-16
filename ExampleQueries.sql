SELECT 
    P.PlayerName,
    G.GameDate,
    G.StartTime,
    S.StadiumName,
    PP.Points,
    PP.Blocks,
    PP.Steals,
    PP.Assists
FROM 
    Player P
JOIN 
    Player_plays_in PP ON P.PlayerID = PP.PlayerID
JOIN 
    Game G ON PP.GameID = G.GameID
JOIN 
    Stadium S ON G.StadiumID = S.StadiumID;
    
SELECT 
    T.TeamName,
    TS.SeasonWins,
    TS.SeasonLosses,
    TS.AvgPoints,
    TS.AvgPointsAllowed,
    TH.AllTimeWins,
    TH.AllTimeLoses
FROM 
    Team T
JOIN 
    Team_Season_Stats TS ON T.TeamID = TS.TeamID
JOIN 
    Team_Historical_Data TH ON T.TeamID = TH.TeamID;