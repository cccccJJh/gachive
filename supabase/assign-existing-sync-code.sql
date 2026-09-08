-- 기존 데이터에 보관함 코드를 한 번만 연결할 때 사용합니다.
-- 앱이 자동 실행하지 않습니다.
-- 'jjjh'를 원하는 보관함 코드로 바꾼 뒤 SQL Editor에서 실행하세요.
-- 이미 sync_code가 있는 행은 변경하지 않습니다.

update public.gachive_saves
set sync_code = 'jjjh'
where sync_code is null
   or btrim(sync_code) = '';
