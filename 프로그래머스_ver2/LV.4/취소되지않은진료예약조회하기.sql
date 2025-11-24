SELECT
    a.apnt_no,
    p.pt_name,
    p.pt_no,
    a.mcdp_cd,
    d.dr_name,
    a.apnt_ymd
FROM
    appointment AS a
JOIN
    patient AS p
ON 
    a.pt_no = p.pt_no
JOIN
    doctor AS d
ON 
    a.mddr_id = d.dr_id
WHERE
    apnt_ymd LIKE '2022-04-13%' 
    AND
    apnt_cncl_yn = 'N'
ORDER BY
    apnt_ymd
;