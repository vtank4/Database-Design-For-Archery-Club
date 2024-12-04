-- restrict the date --
SELECT * FROM roundshoot
WHERE (shoot_date BETWEEN '2022-03-15' and '2022-03-19');

-- restrict the score by date and type of round
SELECT RS.*, RR.RoundDefinitionID 
FROM roundshoot RS
    INNER JOIN EndScoreTable E
    ON RS.EndID = E.EndID
    INNER JOIN RoundRange RR
    ON E.RoundRangeID = RR.RoundRangeID
WHERE (RS.shoot_date BETWEEN '2022-03-15' and '2022-03-19')
    AND (RR.RoundDefinitionID = 'WA90/1440');


-- look up definition of round --
SELECT RR.RoundRangeID,
	   RR.RoundDefinitionID,
	   RR.RangeNumberID,
       RN.RangeDesciption, 
       RN.Distance_in_metre,
       RR.Number_of_Arrows, 
       RR.Number_of_Ends,
       TFS.Target_Face_Size 
FROM roundrange RR
    INNER JOIN rangenumber RN
    ON RR.RangeNumberID = RN.RangeNumberID
    INNER JOIN targetfacesize TFS
    ON RR.TargetFaceID = TFS.TargetFaceID
GROUP BY RR.RoundRangeID,
	     RR.RoundDefinitionID, 
		 RR.RangeNumberID,
         RN.RangeDesciption, 
         RN.Distance_in_metre, 
         RR.Number_of_Arrows, 
         RR.Number_of_Ends, 
         TFS.Target_Face_Size
ORDER BY RR.RoundRangeID;


-- Query to SUM TotalEndScore
-- club competition -- 
SELECT 
    RS.CompetitionID,
    CP.RoundDefinitionID,
    RS.Shoot_date,
    RS.Shoot_Time,
    RS.Archer_ID,
    SUM(E.Arrow1 + E.Arrow2 + E.Arrow3 + E.Arrow4 + E.Arrow5 + E.Arrow6) AS TotalScore
FROM roundshoot RS
INNER JOIN EndScoreTable E ON RS.EndID = E.EndID
INNER JOIN Competition CP ON RS.CompetitionID = CP.CompetitionID
WHERE CP.IsYearlyChampionship = True
GROUP BY RS.CompetitionID, CP.RoundDefinitionID, RS.Archer_ID;

-- show the score of archer in all the round and also with the shoot_date -- 
SELECT 
    RS.CompetitionID,
    CP.RoundDefinitionID,
    RS.Shoot_date,
    RS.Archer_ID,
    SUM(E.Arrow1 + E.Arrow2 + E.Arrow3 + E.Arrow4 + E.Arrow5 + E.Arrow6) AS TotalScore
FROM roundshoot RS
INNER JOIN EndScoreTable E ON RS.EndID = E.EndID
INNER JOIN Competition CP ON RS.CompetitionID = CP.CompetitionID
WHERE archer_id = 100
GROUP BY RS.CompetitionID, CP.RoundDefinitionID, RS.Shoot_date, RS.Archer_ID; 

-- show the score of archer in a specific round and also order by the descendent order that can see the highest score for a round -- 
SELECT 
    RS.CompetitionID,
    CP.RoundDefinitionID,
    RS.Shoot_date,
    RS.Archer_ID,
    SUM(E.Arrow1 + E.Arrow2 + E.Arrow3 + E.Arrow4 + E.Arrow5 + E.Arrow6) AS TotalScore
FROM roundshoot RS
INNER JOIN EndScoreTable E ON RS.EndID = E.EndID
INNER JOIN Competition CP ON RS.CompetitionID = CP.CompetitionID
WHERE archer_id = 100
	AND RS.competitionid = 1
GROUP BY RS.CompetitionID, CP.RoundDefinitionID, RS.Shoot_date, RS.Archer_ID
ORDER BY totalscore DESC; 