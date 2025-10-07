-- 단계별 계산
SELECT COUNT(DISTINCT artwork_id) FROM artworks;
SELECT COUNT(DISTINCT artwork_id) FROM artworks WHERE LOWER(credit) LIKE '%gift%';
SELECT ROUND(73597 / 130262 * 100,3) AS ratio 

-- 서브쿼리
SELECT 
    ROUND(
        (SELECT COUNT(DISTINCT artwork_id) 
         FROM artworks 
         WHERE LOWER(credit) LIKE '%gift%')
         /
        (SELECT COUNT(DISTINCT artwork_id) 
         FROM artworks) * 100,
        3) AS ratio;