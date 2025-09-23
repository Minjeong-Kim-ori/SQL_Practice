WITH hacker_chall_cnt AS (
    SELECT
        h.hacker_id,
        h.name,
        COUNT(*) AS cnt
    FROM
        hackers AS h
    JOIN 
        challenges AS c 
    ON h.hacker_id = c.hacker_id
    GROUP BY
        h.hacker_id, h.name
), -- hacker_id별로 challenge 만든 개수 구하기 
cnt_cnt AS (
    SELECT
        cnt,
        COUNT(*) AS duplicates
    FROM
        hacker_chall_cnt
    GROUP BY
        cnt
) -- challenge 만든 갯수별로 중복값 몇개인지 구하기
SELECT
    hcc.hacker_id,
    hcc.name,
    hcc.cnt
FROM
    hacker_chall_cnt AS hcc 
JOIN
    cnt_cnt AS cc
ON hcc.cnt = cc.cnt
WHERE
    cc.duplicates = 1 -- 중복값이 없으면 출력
    OR
    hcc.cnt = (SELECT MAX(cnt) FROM hacker_chall_cnt) -- 중복값이 있으면 최댓값이랑 동일할 때만 출력 
ORDER BY
    hcc.cnt DESC, hcc.hacker_id
;
