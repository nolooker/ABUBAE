# ABUBAE Storage Plan

## 버킷 구조

### 1. `question-images`
- 공개(public)
- 문제 안에 들어가는 그림, 도표, 트리, UML, 네트워크 토폴로지, 코드 스크린샷 저장

예시 경로:

```text
question-images/
  jeongchogi/
    written/
      2020/
        round-3/
          q-032.png
          q-084.png
    practical/
      2024/
        round-1/
          q-001.png
```

### 2. `resource-previews`
- 공개(public)
- 자료 카드 썸네일, PDF 미리보기 이미지 저장

예시 경로:

```text
resource-previews/
  jeongchogi/
    written-pack/
      thumb.png
      preview-01.png
      preview-02.png
```

### 3. `resource-files`
- 비공개(private)
- 실제 PDF 원본 저장

예시 경로:

```text
resource-files/
  jeongchogi/
    sample/
      written-sample-v1.pdf
    premium/
      written-pack-v1.pdf
      practical-pack-v1.pdf
```

## 현재 관리자 업로드 방식

지금 단계에서는 문제 등록 화면에서 직접 파일 업로드를 하지 않는다.

이유:
- 관리자 인증이 아직 Supabase Auth 기반이 아님
- 현재는 `ADMIN_MASTER_KEY` + cookie 구조
- 따라서 Storage 업로드 권한을 안전하게 주려면 추후 구조 보강이 필요함

현재 방식:
1. Storage에 이미지 업로드
2. 공개 URL 확보
3. `/admin/questions`에서 `문제 이미지 URL` 입력
4. 문제 상세 페이지에서 이미지 표시

## 질문 테이블 연동 컬럼

```sql
image_url text
image_caption text
```

이미지 URL이 있으면:
- 문제 본문 아래
- 보기 위
- 참고 이미지가 렌더링됨

이미지 URL이 없으면:
- 문제 본문 다음에 바로 보기 출력

## 나중 업로드 자동화 방향

다음 단계에서는 `/admin/questions`에 아래 흐름 추가:

1. 파일 선택
2. `question-images` 버킷에 업로드
3. 공개 URL 자동 생성
4. `image_url` 자동 입력
5. 문제 저장

이 단계로 가려면 둘 중 하나가 필요:

1. Supabase Auth 기반 관리자 계정
2. 서버 측 service role 키를 사용하는 안전한 업로드 경로
