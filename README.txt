운동 카운터 v13 - Supabase 동기화

포함 파일
- index.html: 앱
- manifest.webmanifest, icon.svg, sw.js: PWA 파일
- supabase_setup.sql: Supabase DB 테이블 및 보안 정책

중요
- 앱에는 Project URL과 Publishable key만 들어 있습니다.
- Database Password와 Secret key는 앱에 넣지 않습니다.
- PC와 휴대폰에서 같은 이메일/앱 비밀번호 계정으로 로그인하면 기록이 동기화됩니다.
- 로그인 세션은 각 브라우저에 저장되므로 일반적으로 기기마다 최초 1회 로그인하면 됩니다.
- 기기 내부 localStorage 기록을 지우지 마세요.

Supabase 설정
1. Supabase Dashboard > SQL Editor > New query
2. supabase_setup.sql 내용을 붙여넣고 Run
3. Authentication > Providers > Email 에서 Email provider가 활성화되어 있는지 확인
4. 이메일 확인(Confirm email)이 켜져 있으면 가입 후 확인 메일을 한 번 클릭해야 합니다. 이메일 확인을 끄면 가입 직후 로그인할 수 있지만 계정 보안은 낮아질 수 있습니다.

GitHub Pages 배포
1. ZIP을 풉니다.
2. index.html, manifest.webmanifest, icon.svg, sw.js를 GitHub 저장소에서 교체합니다.
3. supabase_setup.sql은 GitHub에 올릴 필요가 없습니다. Supabase SQL Editor에서 실행하세요.
4. Commit changes 후 PC와 휴대폰에서 앱을 열어 같은 이메일 계정으로 로그인합니다.

데이터 이전
- 로그인한 첫 기기에서 기존 기기 내부 기록을 클라우드로 올립니다.
- 다른 기기에서 같은 계정으로 로그인하면 클라우드 기록과 그 기기의 기존 기록을 합쳐 저장합니다.
- 체중은 날짜별로 병합되고, 운동 기록은 중복을 제거해 합칩니다.
- 현재 진행 중인 같은 날짜의 세트 수는 기기별 값을 비교해 더 큰 값을 유지합니다.
- 동기화가 끝나기 전에는 브라우저 데이터나 사이트 저장공간을 삭제하지 마세요.
