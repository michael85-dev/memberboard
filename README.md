# memberboard
 study before Self_proejct

데이터 관리
1. 회원데이터: 회원번호, 아이디, 비밀번호, 이름, 이메일, 전화번호, 프로필사진
	private long m_number;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String m_photo;
	
2. 게시글데이터: 글번호, 제목, 작성자, 내용, 조회수, 작성일자, 첨부파일명
	private long b_number;
	private String b_title;
	private String b_writer;
	private String b_contents;
	private int b_hits;
	private String b_date;
	private String b_filename;
	
3. 댓글데이터: 댓글번호, 게시글번호, 작성자, 작성일자
 	private long c_number;
	private long b_number;
	private String c_writer;
	private String c_contents;
	private String c_date;

 2. 테이블 설계 관련
    1. 게시글과 댓글 작성자는 회원테이블의 아이디를 참조함.
    2. 댓글의 게시글번호는 게시글의 글번호를 참조함.
3. 기능관련
    1. 회원관련 기능
        1. 회원가입
            1. 아이디, 비밀번호, 이름, 이메일, 프로필사진을 입력받음
            2. ajax로 아이디 중복확인을 함.
        2. 로그인
            1. 로그인 완료시 페이징처리된 글목록화면으로 이동함
        3. 로그아웃
            1. 로그아웃 완료시 index 페이지로 이동
        4. 일반회원
            1. 게시글작성, 조회 가능
            2. 본인이 작성한 글에 대해서만 글상세조회시 수정, 삭제 버튼이 보임.
        5. 관리자
            1. 관리자용 페이지가 따로 있음.
            2. 관리자페이지에서 회원 목록 페이지로 이동할 수 있음.
            3. 회원목록 페이지에서 회원 삭제 가능함.
    2. 게시판 관련 기능
        1. 글쓰기 기능
            1. 글쓰기할 때 작성자는 따로 입력하지 않음. 글쓰기 화면 출력되면 로그인 아이디가 작성자 칸에 입력되어 있음.
            2. 제목, 내용, 첨부파일을 입력할 수 있음.
        2. 페이징 목록 출력 기능
            1. 기본적으로 한화면에 5개씩글이 노출되고 페이지번호는 3개가 나옴.
            2. 한화면에 5개씩, 10개씩 글보기를 select로 선택할 수 있음. \(이 기능은 필수는 아니고 선택사항\)
        3. 글수정, 글삭제 기능
            1. 작성자 본인만 수정, 삭제 가능
            2. 관리자는 삭제만 가능
        4. 검색 기능
            1. 작성자, 제목으로 검색할 수 있음.
            2. 검색결과 페이징처리\(선택사항\)
    3. 댓글 관련 기능
        1. 댓글 작성 기능
            1. 댓글작성시 글작성과 마찬가지로 작성자는 로그인 아이디가 미리 작성되어 있음. 내용만 작성할 수 있음.
        2. 댓글 삭제 기능\(선택사항\)
    4. 마이페이지 관련 기능
        1. 로그인하면 마이페이지로 이동할 수 있는 링크가 보임.
        2. 마이페이지로 접속하여 회원정보 수정을 할 수 있음.
        3. 회원정보 수정시 비밀번호를 체크하여 일치하지 않으면 수정처리를 하지 않고 alert 창을 출력함.
        
        
        
## 수정 해야 하는 기능
1. 페이징 기능
2. ??

## 추가해야하는 기능
1. member.update
2. member.detail
3. comment.send 기능
4.