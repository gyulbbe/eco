<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>eco</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-3">
    <!-- 헤더 영역 -->
    <div class="row mb-5">
        <div class="col-9 d-flex">
            <img src="../resources/profile.jpg" alt="프로필" width="100" height="125">
            <div class="ms-3">
                <h2>한 결</h2>
                <p class="mb-1">지원부문: 웹 자료관리 개발 및 유지운영</p>
                <p class="mb-1">성별: 남 | 나이: (만)29세</p>
                <p class="mb-1">연락처: 010-9158-7963</p>
                <p class="mb-1">주소: 경기도 고양시 일산서구 산현로17번길 2 (탄현동)</p>
            </div>
        </div>
        <div class="col-3 text-end">
            <div class="d-flex align-items-center justify-content-end">
                <img src="../resources/logo.jpg" alt="로고">
                <div>
                    <p id="current-date" class="ms-2 mb-0 text-nowrap"></p>
                    <p id="current-time" class="ms-2 mb-0 text-nowrap"></p>
                </div>
            </div>
        </div>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="row">
        <div class="col-6">
            <div class="mb-5">
                <h4 class="border-bottom pb-1">최종 학력</h4>
                <p class="mb-1">2016.03 - 2022.02</p>
                <p class="mb-1">순천향대학교 청소년교육상담학과</p>
                <p class="mb-1">학점: 3.11/4.5</p>
            </div>

            <div class="mb-5">
                <h4 class="border-bottom pb-1">병역사항</h4>
                <p class="mb-1">육군 만기제대</p>
                <p class="mb-1">복무 기간: 2016.12.12 - 2018.09.11</p>
            </div>

            <div class="mb-5">
                <h4 class="border-bottom pb-1">교육이력</h4>
                <div class="row">
                    <div class="col-6">
                        <p class="mb-1">2023.10.16 - 2024.01.22</p>
                        <p class="mb-1">정석코딩</p>
                        <p class="mb-1">웹개발자 취업과정</p>
                    </div>
                    <div class="col-6">
                        <p class="mb-1">2024.05.27 - 2024.12.19</p>
                        <p class="mb-1">중앙HTA IT교육원</p>
                        <p class="mb-1">Public Cloud 활용 자바(JAVA) 웹 애플리케이션(Spring, Docker) 개발자 양성과정</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-6">
            <div class="mb-5">
                <h4 class="border-bottom pb-1">자격증</h4>
                <div class="row">
                    <div class="col-6">
                        <p class="mb-1">정보처리기사</p>
                        <p class="mb-1">한국산업인력공단</p>
                        <p class="mb-1">합격 날짜: 2024.09.10</p>
                    </div>
                    <div class="col-6">
                        <p class="mb-1">SQL 개발자(SQLD)</p>
                        <p class="mb-1">한국데이터산업진흥원</p>
                        <p class="mb-1">합격 날짜: 2024.06.21</p>
                    </div>
                </div>
            </div>

            <div class="mb-5">
                <h4 class="border-bottom pb-1">링크</h4>
                <p class="mb-1"><a href="https://github.com/gyulbbe/eco">Github</a></p>
                <p class="mb-1"><a href="https://www.notion.so/baf59a0858384269b188b51087d14c70">Portfolio</a></p>
                <p class="mb-1"><a href="http://43.200.184.132/">Final Project</a></p>
            </div>

            <div class="mb-5">
                <h4 class="border-bottom pb-1">사용한 스킬</h4>
                <span class="badge bg-secondary me-1">HTML</span>
                <span class="badge bg-secondary me-1">JavaScript</span>
                <span class="badge bg-secondary me-1">JAVA</span>
                <span class="badge bg-secondary me-1">Spring Boot</span>
                <span class="badge bg-secondary me-1">JSP</span>
                <span class="badge bg-secondary me-1">jQuery</span>
                <span class="badge bg-secondary me-1">Bootstrap</span>
                <span class="badge bg-secondary me-1">ajax</span>
            </div>
        </div>
    </div>

    <!-- 이미지와 명언 영역 -->
    <div class="row mb-5">
        <div class="col-3">
            <img id="call-img" alt="호출된 이미지">
        </div>
        <div class="col-9 d-flex align-items-center">
            <div class="border-start ps-3 flex-grow-1 me-3" style="min-height: 50px;">
                <em id="phrase"></em>
            </div>
            <div class="d-flex gap-2">
                <input id="name" type="text" placeholder="이름을 입력하세요.">
                <button id="call-btn" type="button" class="btn btn-primary btn-sm">호출</button>
                <button id="delete-btn" type="button" class="btn btn-danger btn-sm d-none">리셋</button>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    <%-- 페이지에 접속한 날짜, 시간 표시 --%>
    $(document).ready(function () {
        $('#current-date').text(new Intl.DateTimeFormat('ko-KR', {
            dateStyle: 'full'
        }).format(new Date()));
        $('#current-time').text(new Intl.DateTimeFormat('ko-KR', {
            timeStyle: 'short'
        }).format(new Date()).replace(':', '시 ') + '분');
    })

    <%-- 호출 버튼 --%>
    $('#call-btn').click(async function() {
        const name = $('#name').val();
        const encodedName = encodeURIComponent(name.trim());
        const response = await fetch('proxy?encodedName=' + encodedName);
        const result = await response.json();
        if (result.status === 200) {
            const data = result.data
            $('#call-img').attr('src', 'data:image/png;base64,' + data.imageData);
            $('#phrase').text(data.textData);
            $('#delete-btn').removeClass('d-none');
            $('#call-btn').addClass('d-none');
        } else {
            $('#call-img').attr('src', '');
            $('#phrase').text(result.message);
        }
    })

    <%-- 리셋 버튼 --%>
    $('#delete-btn').click(function () {
        $('#call-img').removeAttr('src');
        $('#phrase').text('');
        $('#call-btn').removeClass('d-none');
        $('#delete-btn').addClass('d-none');
        $('#name').val('');
    })
</script>
</body>
</html>