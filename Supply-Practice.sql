/*Find the name and status of each supplier who supplies project J2*/

SELECT 
    SNAME, STATUS
FROM
    SUPPLIER
WHERE
    S_ID IN (SELECT 
            S_ID
        FROM
            SUPPLY
        WHERE
            J_ID = 'J2');
/*Find the name and city of each project supplied by a London-based supplier*/

SELECT 
    JNAME, CITY
FROM
    PROJECT
WHERE
    J_ID IN (SELECT 
            J_ID
        FROM
            SUPPLY
        WHERE
            S_ID IN (SELECT 
                    S_ID
                FROM
                    SUPPLIER
                WHERE
                    CITY = 'LONDON'
/*Find the name and city of each project not supplied by a London-based supplier*/

SELECT
    JNAME, CITY
FROM
    PROJECT
WHERE
    J_ID NOT IN (SELECT
            J_ID
        FROM
            SUPPLY
        WHERE
            S_ID IN (SELECT
                    S_ID
                FROM
                    SUPPLIER
                WHERE
                    CITY = 'LONDON'))

/*Find the supplier name, part name and project name for each case where a supplier supplies a project with a part, but also the supplier city, project city and part city are the same.*/
SELECT 
    SNAME, PNAME, JNAME
FROM
    SUPPLY SY
        JOIN
    SUPPLIER SUP ON SY.S_ID = SUP.S_ID
        JOIN
    PART P ON P.P_ID = SY.P_ID
        JOIN
    PROJECT PJ ON SY.J_ID = PJ.J_ID
WHERE
    SUP.CITY = P.CITY AND P.CITY = PJ.CITY;

