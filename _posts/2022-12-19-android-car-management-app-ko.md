---
title: 안드로이드 차량 관리 앱 프로젝트
lang: ko
ref: android-car-management-app
author: 
date: 2022-12-19 12:00:00 +0900
categories: [Projects, Android]
tags: [Android, Kotlin, Java, Mobile App]
render_with_liquid: false
permalink: /ko/posts/android-car-management-app/
---

## 설명

차량 정비 이력을 손쉽게 관리할 수 있도록 도와주는 앱입니다. 차량 모델과 정비 이력을 기반으로 다음 정비 일정 알림을 보내주고, 올해의 월별 연료 사용량을 막대 그래프로 한눈에 확인할 수 있습니다.

## 기술 스택
Kotlin, Java, Android SDK, Room Database, Firebase, MPAndroidChart

![feature1](./assets/img/post_images/2022-12-19-android-car-management-app/app design.PNG)
_앱 아키텍처_

## 주요 기능

#### 1. 로그인 / 회원가입 / 로그아웃

![feature1](assets/img/post_images/2022-12-19-android-car-management-app/login_register.png)
_로그인 / 회원가입 / 로그아웃_

![feature2](assets/img/post_images/2022-12-19-android-car-management-app/logout.PNG)
_로그아웃_

#### 2. 홈 (내 차량 선택)

![feature3](assets/img/post_images/2022-12-19-android-car-management-app/select your car.PNG)
_내 차량 선택_

#### 3. 정비 이력

![feature5](assets/img/post_images/2022-12-19-android-car-management-app/input.PNG)
_데이터 추가_

![feature4](assets/img/post_images/2022-12-19-android-car-management-app/history.PNG)
_테스트용 더미 데이터 추가_

#### 4. 통계

![feature6](assets/img/post_images/2022-12-19-android-car-management-app/stat.PNG)
_통계와 막대 그래프_

#### 5. 알림(리마인더)

![feature7](assets/img/post_images/2022-12-19-android-car-management-app/reminder1.PNG)
_알림 설정_

![feature8](assets/img/post_images/2022-12-19-android-car-management-app/reminder2.PNG)
_알림 변경_

## 타깃 안드로이드 API
-	Target Android API: 32 (min API 26)

## 참고 자료
-	https://firebase.google.com/docs/auth
-	https://firebase.google.com/docs/auth/android/email-link-auth
-	https://github.com/PhilJay/MPAndroidChart
