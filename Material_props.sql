-- 1. Average hardness (Mean HV10) for each material type
SELECT Material, AVG("Mean HV10") AS Avg_Hardness
FROM cleaned_data
GROUP BY Material;

-- 2. Average bending force and ductility for each material type
SELECT Material,
       AVG("Avg Bending Force (N)") AS Avg_Bending_Force,
       AVG("Ductility %") AS Avg_Ductility
FROM cleaned_data
GROUP BY Material;

-- 3. Count of die-casting vs no die-casting, and their average hardness
SELECT "Die-casting",
       COUNT(*) AS Sample_Count,
       AVG("Mean HV10") AS Avg_Hardness
FROM cleaned_data
GROUP BY "Die-casting";

-- 4. Impact of tempering on bending force
SELECT "Series Tempering",
       AVG("Avg Bending Force (N)") AS Avg_Bending_Force,
       COUNT(*) AS Sample_Count
FROM cleaned_data
GROUP BY "Series Tempering";

-- 5. Which series tempering strategy produces the highest average bending force
SELECT "Series Tempering",
       AVG("Avg Bending Force (N)") AS Avg_Bending_Force
FROM cleaned_data
GROUP BY "Series Tempering"
ORDER BY Avg_Bending_Force DESC;



-- 6. Average ductility for each series tempering strategy
SELECT "Series Tempering",
       AVG("Ductility %") AS Avg_Ductility
FROM cleaned_data
GROUP BY "Series Tempering"
ORDER BY Avg_Ductility DESC;

-- 7. Samples achieving bending force above 6000 N
SELECT *
FROM cleaned_data
WHERE "Avg Bending Force (N)" > 6000;

-- 8. Maximum hardness for each material, and its tempering strategy
SELECT Material,
       MAX("Mean HV10") AS Max_Hardness,
       "Series Tempering"
FROM cleaned_data
GROUP BY Material;

-- 9. Average Chromium content for samples with ductility above 35%
SELECT AVG("Cr [%]") AS Avg_Chromium
FROM cleaned_data
WHERE "Ductility %" > 35;

-- 10. Sulfur range and bending force comparison (low vs high sulfur)
WITH SulfurStats AS (
    SELECT MIN("S [%]") AS Min_S, MAX("S [%]") AS Max_S,
           (MIN("S [%]") + MAX("S [%]")) / 2 AS Mid_S
    FROM cleaned_data
)
SELECT CASE WHEN s."S [%]" <= stats.Mid_S THEN 'Low Sulfur'
            ELSE 'High Sulfur' END AS Sulfur_Group,
       AVG(s."Avg Bending Force (N)") AS Avg_Bending_Force,
       COUNT(*) AS Samples
FROM cleaned_data s, SulfurStats stats
GROUP BY Sulfur_Group;

-- 11. Percentage of samples with hardness variability (HV10 range) > 35
SELECT 100.0 * SUM(CASE WHEN ("Max HV10" - "Min HV10") > 35 THEN 1 ELSE 0 END) / COUNT(*) AS Pct_High_Variability
FROM cleaned_data;

-- 12. Average performance of 4Cr13 with die-casting and tempering
SELECT AVG("Mean HV10") AS Avg_Hardness,
       AVG("Avg Bending Force (N)") AS Avg_Bending_Force,
       AVG("Ductility %") AS Avg_Ductility
FROM cleaned_data
WHERE Material = '4Cr13'
  AND "Die-casting" = 'Yes'
  AND "Series Tempering" <> 'No';
  
  
-- 13. Best combination of Material, Die-casting, and Series Tempering
SELECT Material,
       "Die-casting",
       "Series Tempering",
       AVG("Avg Bending Force (N)") AS Avg_Bending,
       AVG("Ductility %") AS Avg_Ductility,
       AVG("Mean HV10") AS Avg_Hardness
FROM cleaned_data
GROUP BY Material, "Die-casting", "Series Tempering"
ORDER BY Avg_Bending DESC, Avg_Ductility DESC, Avg_Hardness DESC;

-- 14. Effect of diameter (8mm vs 7.8mm) on mechanical properties
SELECT Diameter,
       AVG("Avg Bending Force (N)") AS Avg_Bending_Force,
       AVG("Mean HV10") AS Avg_Hardness,
       AVG("Ductility %") AS Avg_Ductility
FROM cleaned_data
GROUP BY Diameter;


-- 15. Average bending force range for each Series Tempering strategy
SELECT "Series Tempering",
       MAX("Avg Bending Force (N)") - MIN("Avg Bending Force (N)") AS BendingForce_Range
FROM cleaned_data
GROUP BY "Series Tempering";
