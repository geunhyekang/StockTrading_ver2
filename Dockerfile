# ── 베이스 이미지: 자바 21 실행 환경이 깔린 리눅스 ──
# 왜 21? build.gradle의 sourceCompatibility = '21' 과 맞추기 위해
# 왜 JRE? JDK(개발+실행)가 아니라 실행만 하면 되니까 가벼운 JRE
FROM eclipse-temurin:21-jre

# ── 컨테이너 안에서 작업할 폴더 (없으면 자동 생성) ──
WORKDIR /app

# ── 복사: <내 컴퓨터의 jar 경로>  <컨테이너 안 이름> ──
# STEP 7-2에서 확인한 jar 이름을 정확히! (다르면 여기서 not found 에러)
COPY build/libs/day3-0.0.1-SNAPSHOT.jar app.jar

# ── 이 앱은 8080 포트를 쓴다는 표시(문서 역할) ──
EXPOSE 8080

# ── 컨테이너가 시작될 때 실행할 명령 (= 터미널에서 java -jar app.jar 치는 것과 동일) ──
ENTRYPOINT ["java", "-jar", "app.jar"]