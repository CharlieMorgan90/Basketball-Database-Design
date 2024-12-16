CREATE SEQUENCE stadium_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE game_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE playerSeq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE injurySeq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE team_id_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE season_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE trade_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE Stadium (
    StadiumID NUMBER  DEFAULT stadium_id_seq.NEXTVAL PRIMARY KEY,
    StadiumName VARCHAR(100) UNIQUE NOT NULL,
    NoiseLevel NUMBER NOT NULL,
    AvgAttendance NUMBER NOT NULL,
    Capacity NUMBER NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    TicketRevenue NUMBER(15, 2) NOT NULL
);

CREATE TABLE Team (
    TeamID NUMBER  DEFAULT team_id_seq.NEXTVAL PRIMARY KEY,
    TeamName VARCHAR(100) UNIQUE NOT NULL,
    TeamCity VARCHAR(100) UNIQUE NOT NULL,
    TeamCoach VARCHAR(100) UNIQUE NOT NULL,
    StadiumID NUMBER REFERENCES Stadium(StadiumID)
);

CREATE TABLE Game (
    GameID NUMBER DEFAULT game_id_seq.NEXTVAL PRIMARY KEY NOT NULL,
    GameDate Date NOT NULL,
    StartTime TIMESTAMP NOT NULL,
    StadiumID NUMBER REFERENCES Stadium(StadiumID) NOT NULL
);

CREATE INDEX idx_game_date ON Game(GameDate);

CREATE TABLE player (
  PlayerName VARCHAR2(50) NOT NULL,
  PlayerPosition VARCHAR2(30) NOT NULL,
  PlayerWeight NUMBER NOT NULL,
  PlayerHeight VARCHAR2(30) NOT NULL,
  PlayerNationality VARCHAR2(30) NOT NULL,
  PlayerId NUMBER DEFAULT playerSeq.NEXTVAL,
  TeamId NUMBER,
  PRIMARY KEY(PlayerId),
  FOREIGN KEY(TeamId) REFERENCES team(TeamId)
);

CREATE INDEX idx_player_name ON player (PlayerName);

CREATE TABLE player_season_stats (
  BlocksPerGame NUMBER(3, 1) NOT NULL,
  PointsPerGame NUMBER(3, 1) NOT NULL,
  AssistsPerGame NUMBER(3, 1) NOT NULL,
  ReboundsPerGame NUMBER(3, 1) NOT NULL,
  FreeThrowPercentage NUMBER(5, 2),
  ThreePointPercentage NUMBER(5, 2),
  FieldGoalPercentage NUMBER(5, 2),
  SeasonId VARCHAR2(9), -- "YYYY-YYYY" format
  PlayerId NUMBER,
  PRIMARY KEY (SeasonId, PlayerId),
  FOREIGN KEY (PlayerId) REFERENCES player(PlayerId)
);

CREATE TABLE player_historical_stats (
  CareerRebounds NUMBER NOT NULL,
  CareerAssists NUMBER NOT NULL,
  CareerPoints NUMBER NOT NULL,
  CareerBlocks NUMBER NOT NULL,
  CareerSteals NUMBER NOT NULL,
  CareerGamesPlayed NUMBER NOT NULL,
  PlayerId NUMBER,
  PRIMARY KEY(PlayerId),
  FOREIGN KEY (PlayerId) REFERENCES player(PlayerId)
);

CREATE TABLE player_injury_records (
  InjuryType VARCHAR(20) NOT NULL,
  RecurrenceRate NUMBER(5, 2) NOT NULL,
  GamesMissed NUMBER NOT NULL,
  RecoveryDate DATE NOT NULL,
  InjuryStartDate DATE NOT NULL,
  PlayerId NUMBER NOT NULL,
  InjuryId NUMBER DEFAULT injurySeq.NEXTVAL,
  PRIMARY KEY(InjuryId),
  FOREIGN KEY (PlayerId) REFERENCES player(PlayerId)
);

CREATE TABLE Team_Historical_Data (
    TeamID NUMBER REFERENCES Team(TeamID) PRIMARY KEY,
    AllTimeWins NUMBER,
    AllTimeLoses NUMBER
);

CREATE TABLE Team_Season_Stats (
    SeasonID NUMBER DEFAULT season_id_seq.NEXTVAL,
    TeamID NUMBER REFERENCES Team(TeamID),
    SeasonWins NUMBER,
    SeasonLosses NUMBER,
    AvgPoints NUMBER(5, 2),
    AvgPointsAllowed NUMBER(5, 2),
    PRIMARY KEY (SeasonID, TeamID)
);

CREATE TABLE Trade_Record (
    TradeID NUMBER  DEFAULT trade_id_seq.NEXTVAL PRIMARY KEY,
    ReceivingTeam NUMBER REFERENCES Team(TeamID),
    LosingTeam NUMBER REFERENCES Team(TeamID),
    PlayerLost NUMBER REFERENCES Player(PlayerID),
    PlayerGained NUMBER REFERENCES Player(PlayerID),
    DraftPickReceived VARCHAR(50),
    DraftPickLost VARCHAR(50),
    DateOfTrade DATE
);

CREATE TABLE Championship_Year (
    ChampionshipYear NUMBER NOT NULL,
    TeamID NUMBER REFERENCES Team(TeamID),
    PRIMARY KEY (ChampionshipYear, TeamID)
);

CREATE INDEX idx_championship_year ON Championship_Year(ChampionshipYear);

CREATE TABLE Player_plays_in (
    GameID NUMBER REFERENCES Game(GameID),
    PlayerID NUMBER REFERENCES Player(PlayerID),
    Points NUMBER NOT NULL,
    Blocks NUMBER NOT NULL,
    Steals NUMBER NOT NULL,
    Assists NUMBER NOT NULL,
    PRIMARY KEY (GameID, PlayerID)
);

CREATE TABLE Team_plays_in (
    GameID NUMBER REFERENCES Game(GameID),
    TeamID NUMBER REFERENCES Team(TeamID),
    Score NUMBER NOT NULL,
    WinStatus NUMBER(1) NOT NULL, 
    HomeGameStatus NUMBER(1) NOT NULL
);