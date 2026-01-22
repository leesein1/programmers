/*
    이 서비스에서는 공간을 둘 이상 등록한 사람을 "헤비 유저"라고 부릅니다. 
    헤비 유저가 등록한 공간의 정보를 아이디 순으로 조회하는 SQL문을 작성해주세요.
    

*/
select ID, NAME, HOST_ID from PLACES a
where
HOST_ID IN(
    select HOST_ID from PLACES
    group by HOST_ID
    having count(*) >= 2
)
order by ID;
    
    
    