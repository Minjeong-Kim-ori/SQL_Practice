-- with절로 하려고 하니까 자꾸 에러나서 서브쿼리...ㅜ 
SELECT
    t.contest_id,
    t.hacker_id,
    t.name,
    COALESCE(SUM(ss.sum_submits), 0) AS total_submits,
    COALESCE(SUM(ss.sum_accepted_submits), 0) AS total_accepted_submits,
    COALESCE(SUM(sv.sum_views), 0) AS total_views,
    COALESCE(SUM(sv.sum_unique_views), 0) AS total_unique_views
FROM    
    contests AS t 
JOIN 
    colleges AS c 
ON t.contest_id = c.contest_id
JOIN
    challenges AS g 
ON c.college_id = g.college_id
LEFT JOIN (
    SELECT
        challenge_id,
        SUM(total_views) AS sum_views,
        SUM(total_unique_views) AS sum_unique_views
    FROM
        view_stats
    GROUP BY
        challenge_id
) AS sv -- challeng_id별로 view 집계해놓고 left join
ON g.challenge_id = sv.challenge_id
LEFT JOIN (    
    SELECT
        challenge_id,
        SUM(total_submissions) AS sum_submits,
        SUM(total_accepted_submissions) AS sum_accepted_submits
    FROM
        submission_stats
    GROUP BY
        challenge_id
) AS ss -- challenge_id별로 submission 집계해놓고 left join
ON g.challenge_id = ss.challenge_id
GROUP BY
    t.contest_id, t.hacker_id, t.name -- 이제 contest_id별로 집계 
HAVING
    (COALESCE(SUM(ss.sum_submits),0) +
     COALESCE(SUM(ss.sum_accepted_submits),0) +
     COALESCE(SUM(sv.sum_views),0) +
     COALESCE(SUM(sv.sum_unique_views),0)) > 0 -- null이면 합계 시 제외될 수 있으므로 COALESCE로 처리해주기
ORDER BY
    t.contest_id
;


-- with 절로 하면..! 
WITH view_summary AS (
    SELECT
        challenge_id,
        SUM(total_views) AS sum_views,
        SUM(total_unique_views) AS sum_unique_views
    FROM view_stats
    GROUP BY challenge_id
), -- view 집계
submission_summary AS (
    SELECT
        challenge_id,
        SUM(total_submissions) AS sum_submits,
        SUM(total_accepted_submissions) AS sum_accepted_submits
    FROM submission_stats
    GROUP BY challenge_id
), -- submission 집계
contest_challenges AS (
    SELECT
        t.contest_id,
        t.hacker_id,
        t.name,
        g.challenge_id
    FROM 
        contests AS t
    JOIN 
        colleges AS c
    ON t.contest_id = c.contest_id
    JOIN 
        challenges AS g
    ON c.college_id = g.college_id
) -- contest별, hacker별 college의 challenge_id 구해놓기
SELECT
    cc.contest_id,
    cc.hacker_id,
    cc.name,
    COALESCE(SUM(ss.sum_submits), 0) AS total_submits,
    COALESCE(SUM(ss.sum_accepted_submits), 0) AS total_accepted_submits,
    COALESCE(SUM(vs.sum_views), 0) AS total_views,
    COALESCE(SUM(vs.sum_unique_views), 0) AS total_unique_views
FROM 
    contest_challenges AS cc
LEFT JOIN 
    view_summary AS vs
ON cc.challenge_id = vs.challenge_id
LEFT JOIN 
    submission_summary AS ss
ON cc.challenge_id = ss.challenge_id
GROUP BY 
    cc.contest_id, cc.hacker_id, cc.name
HAVING 
    (COALESCE(SUM(ss.sum_submits), 0) +
     COALESCE(SUM(ss.sum_accepted_submits), 0) +
     COALESCE(SUM(vs.sum_views), 0) +
     COALESCE(SUM(vs.sum_unique_views), 0)) > 0
ORDER BY 
    cc.contest_id
;

