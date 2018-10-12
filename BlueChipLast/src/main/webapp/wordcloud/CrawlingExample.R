rm(list=ls()) # 저장된 모든 변수 삭제

# 텍스트 파일을 읽어올 경로
# setwd("D:/javabigdata2/Rwork")

# 워드 클라우드에 필요한 패키지 설치
# install.packages("KoNLP")
# install.packages("wordcloud")
# install.packages("rvest")
# install.packages("wordcloud2")


# 라이브러리
library(KoNLP)
library(wordcloud2)
library(RColorBrewer)
library(rvest)
search() # 라이브러리 확인

# 다음 영화에서 맘마미아2 평점
# https://movie.daum.net/moviedb/grade?movieId=112899&type=netizen&page=1

url_base<-"https://movie.daum.net/moviedb/grade?movieId=112899&type=netizen&page="

allreviews<-c()

for(page in 1:10){
  url<-paste(url_base,page,sep='')
  htxt<-read_html(url)
  table<-html_nodes(htxt,'div.review_info')
  content<-html_nodes(table,'p.desc_review')
  reviews<-html_text(content)
  if(length(reviews)==0) break
  allreviews<-c(allreviews,reviews)
}
print(allreviews)
filename="daummovie"
write.table(allreviews,paste(filename,".txt",sep='')) # 파일로 저장

# 클라우드로 만들기

# 세종 사전을 가져옴
useSejongDic()
  
# 분석용 데이터 가져오기
t<-file(paste(filename,".txt",sep=''))
txt<-readLines(t)
txt # 파일에서 가져온 값 확인하기

# 데이터중에서 명사만 골라서 place에 할당
# extractNoun : KoNLP에서 제공하는 명사추출명령
place<-sapply(txt,extractNoun,USE.NAMES = F)
place

# 추출된 명사를 30개만 출력
head(unlist(place),30)

# 필터링을 위해 unlist 작업을 해서 저장
c<-unlist(place)
c

# 두글자나 세글자(각자정함) 이상되는 것만 필터링
place<-Filter(function(x){nchar(x)>=2},c)
place

# 원하지 않는 내용 걸러내기(텍스트 정제):gsub(걸러낼 문자,바뀔문자,원본데이터)
place<-gsub("\\d","",place) # 모든 숫자 제거
place<-gsub("[0-9]","",place) # 모든 숫자 제거(위와 동일)
place<-gsub("\\s","",place) # 공백 제거
place<-gsub("\\t","",place) # 탭 제거
place<-gsub("[ㄱ-ㅎ]","",place) # 한글 자음 제거
place<-gsub("[ㅏ-ㅣ]","",place) # 한글 모음 제거
place<-gsub('[~!@#$%^&*()_+=?]<>','',place) #  특수문자 제거
place

# 한번 더 걸러줌
place<-Filter(function(x){nchar(x)>=2},place)
place

# 파일로 저장한 후 테이블 형태로 변화하여 불러온다
write(unlist(place),paste(filename,"_2.txt",sep=''))

# 수정완료된 파일을 table 형식으로 변환하여 다시 불러온다
rev<-read.table(paste(filename,"_2.txt",sep=''))
rev

nrow(rev) # 데이터 갯수 확인

wordcount<-table(rev) # 워드 카운트 파일 생성
wordcount

# 상위 데이터만 조회
wordcount2<-head(sort(wordcount,decreasing = T),100)
wordcount2

# 출력 지시
# freq:빈도,min.freq:최소단어빈도,max.words:표현단어수,
# random.order:고빈도단어중앙배치,rot.per:회전단어비율,
# scale:단어크기범위,colors:색상 목록
mycloud<-wordcloud2(data=wordcount2, minSize=0, shape='circle', size=1, fontFamily='segoe UI', color='random-light')

htmltools::save_html(mycloud, file = 'D:/javabigdata2/test0001.html')
# htmltools::save_html(mycloud, file = "/root/test0001.html")

mycloud


library('Rserve')

Rserve(FALSE,port=6311,args='--RS-encoding utf8 --no-save --slave --encoding utf8')



R.exe --vanilla -e "library(Rserve,lib.loc='C:/Users/orauser/.Rserve');Rserve(FALSE,args='--vanilla --RS-port 6311 --RS-encoding utf8 --no-save --slave --encoding utf8');flush.console

