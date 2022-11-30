package kr.or.ddit.controller.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.dao.datagenerator.DataGenerator;
import kr.or.ddit.dto.datagenerator.DataGeneratorLectureVO;
import kr.or.ddit.dto.datagenerator.DataGeneratorVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/generator")
public class DataGeneratorController {
	@Autowired
	DataGenerator dgdao;

	@RequestMapping("/college")
	public String college(Model model) {
		String url = "check";
		String prefix = "CLG";
		int lastNum = 00;

		String[] collegeList = { "법과대학", "생명과학대학", "정경대학", "사범대학", "간호대학", "국제대학", };
		int[] tuitionList = { 4000000, 4500000, 5000000, 5500000, 4000000, 6000000 };
		int[] avail_credit = { 21, 18, 20, 21, 18, 22 };
		for (int i = 0; i < collegeList.length; i++) {
			DataGeneratorVO datagenerator = new DataGeneratorVO();
			String colCd = prefix + String.format("%04d", lastNum);
			datagenerator.setColCd(colCd);
			datagenerator.setColName(collegeList[i]);
			datagenerator.setTuition(tuitionList[i]);
			datagenerator.setAvailCredit(avail_credit[i]);
			dgdao.insertIntoCollege(datagenerator);
			lastNum++;

		}

		model.addAttribute("check", "success");
		return url;
	}

	@RequestMapping("/major")
	public String major(Model model) {
		String url = "check";

		String prefix = "MJR";
		int num = 3;
		Set<String[]> set = new HashSet();
		String[] CLG0001 = { "CLG0001", "기계공학과", "제어계측공학과", "항공우주공학과", "자동차공학과", "철도공학과", "조선해양공학과", "농업기계공학과", "로봇공학과",
				"전자공학과", "전기공학과", "전기전자공학과", "원자력공학과", "고분자공학과", "섬유공학과", "무기재료공학과", "세라믹공학과", "금속공학과", "생명공학과" };
		String[] CLG0002 = { "CLG0002", "언어학", "국어 국문학", "러시아어", "스페인어", "중국어", "영어", "영문학", "일본어", "프랑스어", "문예창작",
				"철학", "윤리학", "역사", "고고학", "종교학", "문화", "민속", "미술사학", "국제지역학", "교양인문학",

		};
		String[] CLG0003 = { "CLG0003", "농업학", "수산학", "산림·원예학", "생명과학", "생물학", "동물·수의학", "자원학", "화학", "환경학", "가정관리학",
				"식품영양학", "의류·의상학", "교양생물과학", "수학", "통계학", "물리·과학", "천문·기상학", "지구·지리학", "교양자연과학" };
		String[] CLG0004 = {

				"CLG0004", "의학", "치의학", "한의학", "약학", "재활학", "의료공학" };
		String[] CLG0005 = { "CLG0005", "음악대학", "연극학과", "영화영상학과", "공연제작과", "모델과", "사진학과", "게임학과", "만화애니메이션학과", "미용학과",
				"교회음악과", "성악과" };
		String[] CLG0006 = { "CLG0006", "경영정보학과", "경영학과", "글로벌테크노경영전공", "IT경영전공", "산업경영전공", "회계학", "관광경영학과", "관광호텔경영학부",
				"금융학과", "회계학과", "경제통상학부", "세무경영학과", "세무학과", "광고홍보이벤트학과", "광고홍보학과", "광고홍보학부" };
		String[] CLG0007 = { "CLG0007", "행정학", "사회복지학", "사회학", "문화인류학", "언론홍보영상학", "지역학협동" };
		String[] CLG0008 = { "CLG0008", "법학과" };
		String[] CLG0009 = { "CLG0009", "시스템생물학", "생화학" };
		String[] CLG0010 = { "CLG0010", "정치외교학", };
		String[] CLG0011 = { "CLG0011", "국어교육과", "수학교육과", "사회교육과", "과학교육과", "기술가정교육과" };
		String[] CLG0012 = { "CLG0012", "보건학", "간호학과" };
		String[] CLG0013 = { "CLG0013", "국제 무역학", "국제 통상학", "국제 역사학", "국제 경영학" };

		List<String[]> collegeList = new ArrayList<String[]>();
		collegeList.add(CLG0001);
		collegeList.add(CLG0002);
		collegeList.add(CLG0003);
		collegeList.add(CLG0004);
		collegeList.add(CLG0005);
		collegeList.add(CLG0006);
		collegeList.add(CLG0007);
		collegeList.add(CLG0008);
		collegeList.add(CLG0009);
		collegeList.add(CLG0010);
		collegeList.add(CLG0011);
		collegeList.add(CLG0012);
		collegeList.add(CLG0013);
		for (String[] collegeMajorList : collegeList) {
			for (int i = 1; i < collegeMajorList.length; i++) {
				DataGeneratorVO dvo = new DataGeneratorVO();
				dvo.setMajorCd(prefix + String.format("%04d", num));
				System.out.println(prefix + num);
				dvo.setMajorName(collegeMajorList[i]);
				System.out.println(collegeMajorList[i]);
				dvo.setMajorPhone("010123451" + num);
				dvo.setMajorWeb("www." + collegeMajorList[i] + ".com");
				dvo.setCollegeCd(collegeMajorList[0]);
				dvo.setSemeCd("202202");
				dgdao.insertIntoMajor(dvo);
				num++;
			}
		}
		model.addAttribute("check", "success");
		return url;

	}

	@RequestMapping("/company")
	public String company(Model model) {
		String url = "check";
		String prefix = "CP";
		int num = 1;
		String[] companyList = { "삼성생명", "삼성전자", "한화생명", "한국전력공사", "삼성화재해상보험", "SK하이닉스", "미래에셋증권", "현대자동차", "POSCO홀딩스",
				"삼성증권", "NH투자증권", "현대해상", "DB손해보험", "기아", "삼성물산", "미래에셋생명", "메리츠증권", "한국가스공사", "키움증권", "동양생명", "신한지주",
				"현대제철", "현대모비스", "LG화학", "LG전자", "LG디스플레이", "케이티", "KB금융", "메리츠화재", "SK", "네이버", "카카오", "Google" };
		for (String company : companyList) {
			DataGeneratorVO dgv = new DataGeneratorVO();
			String companyCd = prefix + String.format("%04d", num);
			dgv.setCompanyCd(companyCd);
			System.out.println(companyCd);
			dgv.setName(company);
			System.out.println(company);
			dgdao.insertIntoCompany(dgv);
			num++;
		}

		model.addAttribute("check", "success");
		return url;
	}

	@RequestMapping("/companySec")
	public String companySec(Model model) {
		String url = "check";
		String prefix = "SEC";
		int num = 5;
		String[] companySecList = { "관리직(임원·부서장)", "경영·행정·사무직", "금융·보험직", "인문·사회과학 연구직", "자연·생명과학 연구직",
				"정보통신 연구개발직 및 공학기술직", "건설·채굴 연구개발직 및 공학기술직", "제조 연구개발직 및 공학기술직", "교육직", "법률직", "사회복지·종교직", "경찰·소방·교도직",
				"군인", "보건·의료직", "예술·디자인·방송직", "스포츠·레크리에이션직", "미용·예식 서비스직", "여행·숙박·오락 서비스직", "음식 서비스직", "경호·경비직",
				"돌봄 서비스직(간병·육아)", "청소 및 기타 개인서비스직", "영업·판매직", "운전·운송직", "건설·채굴직", "기계 설치·정비·생산직", "금속·재료 설치·정비·생산직",
				"전기·전자 설치·정비·생산직", "정보통신 설치·정비직", "화학·환경 설치·정비·생산직", "섬유·의복 생산직", "식품 가공·생산직",
				"인쇄·목재·공예 및 기타 설치·정비·생산직", "제조 단순직", "농림어업직", };
		for (String sector : companySecList) {
			DataGeneratorVO dgv = new DataGeneratorVO();
			String secCd = prefix + String.format("%02d", num);
			dgv.setSecCd(secCd);
			System.out.println(secCd);
			dgv.setSecName(sector);
			System.out.println(sector);
			dgdao.insertIntoCompanySec(dgv);
			num++;
		}
		model.addAttribute("check", "success");
		return url;
	}

	Random random = new Random();
	String url = "check";
	String[] prefix = { "15", "16", "17", "18", "19", "20", "21", "22" };
	String[] division = { "0", "1", "2" };
	String[] memClassCd = { "prof", "stu", "staff" };

	String[] firstName = { "김", "나", "이", "박", "최", "한", "양", "장", "심", "윤", "곽" };
	String[] secondName = { "지", "재", "형", "태", "미", "혜", "희", "성", "수", "성", "상", "건", "정" };
	String[] thirdName = { "훈", "주", "영", "정", "혁", "빈", "림", "웅", "권", "혁", "미", "린", "열" };
	String[] add1List = { "대전 서구", "대전 중구", "대전 동구", "대전 유성구", "대전 대덕구", "서울 서대문구", "서울 강남구", "서울 마포구" };
	String[] add2List = { "가장동", "미포동", "개포동", "삼성동", "용문동", "둔산동", "산성동", "이호동", "효자동", "한국동" };
	String[] bankName = { "카카오뱅크", "우리은행", "기업은행", "국민은행", "신한은행", "농협", "제주은행" };
	String[] status = { "0", "1", "2", "3", "4" };
	int[] majorStuNum = new int[113];

	@RequestMapping("/member")
	public String member(Model model) {
		String url = "check";

		for (int i = 0; i < 999; i++) {
			int majorCode = random.nextInt(113);
			int divisionNum = random.nextInt(division.length);
			String divide = division[divisionNum];
			String id = prefix[random.nextInt(prefix.length)] + divide + String.format("%03d", majorCode)
					+ String.format("%03d", majorStuNum[majorCode]++);
			DataGeneratorVO data = new DataGeneratorVO();
			data.setMemId(id);
			data.setMemPwd("1234");
			String name = firstName[random.nextInt(firstName.length)] + secondName[random.nextInt(secondName.length)]
					+ thirdName[random.nextInt(thirdName.length)];
			data.setName(name);
			// data.setEname("Michael");
			// data.setPhone("01012341234");
			// data.setAdd1(add1List[random.nextInt(add1List.length)]);
			// data.setAdd2(add2List[random.nextInt(add2List.length)]);
			// data.setEmail("abcd1234@google.com");
			// data.setBankName(bankName[random.nextInt(bankName.length)]);
			// data.setAccHolder(name);
			// data.setAccNum("12341234124");
			data.setMemStatusCd(status[random.nextInt(status.length)]);
			data.setMemClassCd(memClassCd[divisionNum]);

			dgdao.insertIntoMember(data);
		}
		model.addAttribute("check", "success");
		return url;
	}

	String[] year = { "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001",
			"2002", "2003", "2004", "2005", "2006", "2007" };
	String[] month = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };
	String[] date = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16",
			"17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" };

	@RequestMapping("/student")
	public String student(Model model) {
		String url = "check";
		List<String> stuList = dgdao.selectStudentList();
		List<String> companyList = dgdao.selectListCompanyCdList();
		Random random = new Random();

		String[] mbtiList = { "ISTJ", "ISFJ", "INFJ", "INTJ", "ISTP", "ISFP", "INFP", "INTP", "ESTP", "ESFP", "ENFP",
				"ENTP", "ESTJ", "ESFJ", "ENFJ", "ENTJ" };
		String[] clubList = { "CLUB0001", "CLUB0006", "CLUB0011", "CLUB0015", "CLUB0002", "CLUB0007", "CLUB0012",
				"CLUB0016", "CLUB0003", "CLUB0008", "CLUB0013", "CLUB0004", "CLUB0009", "CLUB0014", "CLUB0005",
				"CLUB0010" };
		String[] firstName = { "김", "나", "이", "박", "최", "한", "양", "장", "심", "윤", "곽" };
		String[] secondName = { "지", "재", "형", "태", "미", "혜", "희", "성", "수", "성", "상", "건", "정" };
		String[] thirdName = { "훈", "주", "영", "정", "혁", "빈", "림", "웅", "권", "혁", "미", "린", "열" };
		String[] add1List = { "대전 서구", "대전 중구", "대전 동구", "대전 유성구", "대전 대덕구", "서울 서대문구", "서울 강남구", "서울 마포구" };
		String[] add2List = { "가장동", "미포동", "개포동", "삼성동", "용문동", "둔산동", "산성동", "이호동", "효자동", "한국동" };
		String[] bankName = { "카카오뱅크", "우리은행", "기업은행", "국민은행", "신한은행", "농협", "제주은행" };
		String[] zipcode = { "30001", "30002", "30003", "30004", "30005", "30006", "30007" };
		List<String> secList = dgdao.selectSecCdList();
		for (String stdCode : stuList) {
			DataGeneratorVO dgv = new DataGeneratorVO();
			dgv.setStuCd(stdCode);
			dgv.setBirthday(year[random.nextInt(year.length)] + month[random.nextInt(month.length)]
					+ date[random.nextInt(date.length)]);
			String name = firstName[random.nextInt(firstName.length)] + secondName[random.nextInt(secondName.length)]
					+ thirdName[random.nextInt(thirdName.length)];
			dgv.setName(name);
			dgv.setEname("Michael");
			dgv.setPhone("01012341234");
			dgv.setAdd1(add1List[random.nextInt(add1List.length)]);
			dgv.setAdd2(add2List[random.nextInt(add2List.length)]);
			dgv.setEmail("abcd1234@google.com");
			dgv.setBankName(bankName[random.nextInt(bankName.length)]);
			dgv.setAccHolder(name);
			dgv.setAccNum("12341234124");
			dgv.setZipcode(zipcode[random.nextInt(zipcode.length)]);
			float ranNum = random.nextFloat();
			String nation = "";
			String acaState = "";
			if (ranNum > 0.3) {
				nation = "Korea";
			} else if (ranNum > 0.2) {
				nation = "America";
			} else if (ranNum > 0.1) {
				nation = "China";
			} else if (ranNum > 0.5) {
				nation = "Japan";

			} else if (ranNum > 0.3) {
				nation = "Austrailia";
			} else {
				nation = "Canada";
			}
			dgv.setNation(nation);

			float ranNum2 = random.nextFloat();
			if (ranNum2 > 0.3) {
				acaState = "attend";
			} else {
				acaState = "rest";
			}
			int grade = random.nextInt(4) + 1;
			String stuSemester = (random.nextInt(2) + 1) + "";
			try {
				Integer.parseInt(stdCode.substring(0, 2));
				if (stdCode.equals("22201001")) {
					continue;
				}
			} catch (Exception e) {
				continue;
			}
			if (Integer.parseInt(stdCode.substring(0, 2)) < 19 && ranNum2 > 0.3) {
				acaState = "employ";
				grade = 4;
				stuSemester = "2";
			} else if (Integer.parseInt(stdCode.substring(0, 2)) < 19 && ranNum2 <= 0.3) {
				acaState = "unemploy";
				grade = 4;
				stuSemester = "2";
			}
			dgv.setCompanyCd(companyList.get(random.nextInt(companyList.size())));
			dgv.setSecCd(secList.get(random.nextInt(secList.size())));
			if (acaState.equals("attend") || acaState.equals("rest")) {
				dgv.setCompanyCd("none");
				dgv.setSecCd("none");
			}

			dgv.setClubCd(clubList[random.nextInt(clubList.length)]);
			dgv.setTlTryCount(random.nextInt(6));
			dgv.setAcaStateCd(acaState);
			dgv.setMbtiCd(mbtiList[random.nextInt(mbtiList.length)]);
			dgv.setGrade(grade);
			dgv.setStuSemster(stuSemester);
			dgdao.insertIntoStudent(dgv);

		}
		model.addAttribute("check", "success");
		return url;
	}

	@RequestMapping("/stuMajor")
	public String stuMajor(Model model) {
		String url = "check";
		List<String> stuList = dgdao.selectStudentList();
		List<String> majorList = dgdao.selectListMajor();
		Random random = new Random();
		String[] divisionList = { "1", "2", "3", "4" };
		String stuMajorCd = "";
		String majorCode = "";
		for (int j = 0; j < stuList.size(); j++) {
			String stuCd = stuList.get(j);

			Set<String> selectMajorSet = new HashSet<String>();
			for (int i = 0; i < random.nextInt(5); i++) {
				majorCode = majorList.get(random.nextInt(majorList.size()));
				selectMajorSet.add(majorCode);
			}
			int index = 0;
			for (String majorCd : selectMajorSet) {
				DataGeneratorVO dgv = new DataGeneratorVO();
				stuMajorCd = majorCd.substring(majorCd.length() - 2) + stuCd;
				dgv.setStuMajorCd(stuMajorCd);
				dgv.setStuId(stuCd);
				dgv.setMajorCd(majorCd);
				dgv.setDivision(divisionList[index]);
				dgdao.insertIntoStuMajor(dgv);
				index++;
			}

		}
		model.addAttribute("check", "success");

		return url;
	}

	@RequestMapping("/lecmanage")
	public String lecmanage(Model model) {
		String url = "check";
		String lecCdPrefix = "SBJ";
		String lecNMprefix = "컴퓨터 언어의 이해";
		String[] lecCategoryCdList = { "mjre", "mjse", "gere", "gese" };
		String[] geCdList = { "cg0001", "cg0002", "cg0003", "cg0004", "cg0005", "cg0006", "cg0007", "cg0008", "cg0009",
				"cg0010", "cg0011", "cg0012" };
		List<String> majorCdList = dgdao.selectListMajor();
		for (int i = 500; i < 1000; i++) {
			DataGeneratorLectureVO lvo = new DataGeneratorLectureVO();
			String lecCd = lecCdPrefix + String.format("%04d", i);
			String lecName = lecNMprefix + i;
			lvo.setSubjCd(lecCd);
			lvo.setSubjName(lecName);
			String lecCategoryCd = lecCategoryCdList[random.nextInt(lecCategoryCdList.length)];
			lvo.setLecCategoryCd(lecCategoryCd);
			lvo.setTargetGrade((random.nextInt(6) + 1) + "");
			lvo.setCredit(random.nextInt(3) + 1);
			
			String majorCd = majorCdList.get(random.nextInt(majorCdList.size()));
			if (lecCategoryCd.equals("mjre") || lecCategoryCd.equals("mjse")) {
				lvo.setMajorCd(majorCd);
				lvo.setGeCd("none");
			} else {
				lvo.setGeCd(geCdList[random.nextInt(geCdList.length)]);
				lvo.setTargetGrade("all");
			}
			dgdao.insertIntoLecManage(lvo);
		}
		model.addAttribute("check", "success");
		return url;
	}

	/*
	 * @RequestMapping("/gecategory") public String gecategory(Model model) { String
	 * url = "check"; String gePrefix = "cg"; String geNmprefix = "교양카테고리"; for(int
	 * i=0;i<10;i++) { DataGeneratorLectureVO lvo = new DataGeneratorLectureVO();
	 * String geCd = gePrefix+String.format("%04d",i); String geName = geNmprefix+i;
	 * lvo.setGeCd(geCd); lvo.setGeCategoryNm(geName);
	 * dgdao.insertIntoGeCategory(lvo); } model.addAttribute("check", "success");
	 * return url; }
	 */

	@RequestMapping("/prof")
	public String prof(Model model) {
		String url = "check";
		List<DataGeneratorVO> profIdList = dgdao.selectListProf();
		log.info("교수리스트 사이즈 : " + profIdList.size());
		List<String> majorList = dgdao.selectListMajor();
		String[] profPosiCd = { "norm", "dir" };
		for (DataGeneratorVO profIdVO : profIdList) {
			if (profIdVO.getProfCd().equals("ri")) {
				continue;
			}
			DataGeneratorVO dgv = new DataGeneratorVO();
			dgv.setProfCd(profIdVO.getProfCd());
			dgv.setMajorCd(majorList.get(random.nextInt(majorList.size())));
			dgv.setProfPosiCd(profPosiCd[random.nextInt(profPosiCd.length)]);
			dgv.setBirthday(year[random.nextInt(year.length)] + month[random.nextInt(month.length)]
					+ date[random.nextInt(date.length)]);
			String name = firstName[random.nextInt(firstName.length)] + secondName[random.nextInt(secondName.length)]
					+ thirdName[random.nextInt(thirdName.length)];
			dgv.setName(name);
			dgv.setEname("Michael");
			dgv.setPhone("01012341234");
			dgv.setAdd1(add1List[random.nextInt(add1List.length)]);
			dgv.setAdd2(add2List[random.nextInt(add2List.length)]);
			dgv.setEmail("abcd1234@google.com");
			dgdao.insertIntoProf(dgv);
		}

		model.addAttribute("check", "success");
		return url;
	}

	// 전공과목
	@RequestMapping("/syllabus")
	public String syllabus(Model model) {
		String url = "check";
		List<DataGeneratorVO> profIdList = dgdao.selectListProf();
		List<String> geSubjList = dgdao.selectListGeSubject();
		// 전공과목 List<String> subjListSelectByProfCd =
		// dgdao.selectListSubjectByProfCd(profId);
		Random random = new Random();
		String sylPrefix = "SYL";
		String[] evalClassCd = { "exam", "nexam" };
		String[] classroom = { "S401", "S402", "S403", "S404", "S405", "S406", "S407", "S408", "S409", "S410", "S101",
				"S102", "S103", "S104", "S105", "S106", "S107", "S108", "S109", "S110", "S201", "S202", "S203", "S204",
				"S205", "S206", "S207", "S208", "S209", "S210", "S301", "S302", "S303", "S304", "S305", "S306", "S307",
				"S308", "S309", "S310", "S501", "S502", "S503", "S504", "S505", "S506", "S507", "S508", "S509", "S510",

				"N401", "N402", "N403", "N404", "N405", "N406", "N407", "N408", "N409", "N410", "N101", "N102", "N103",
				"N104", "N105", "N106", "N107", "N108", "N109", "N110", "N201", "N202", "N203", "N204", "N205", "N206",
				"N207", "N208", "N209", "N210", "N301", "N302", "N303", "N304", "N305", "N306", "N307", "N308", "N309",
				"N310", "N501", "N502", "N503", "N504", "N505", "N506", "N507", "N508", "N509", "N510", };
		String[] day = { "월", "화", "수", "목", "금" };
		String[] startTime = { "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00" };
		String[] endTime = { "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00" };
		// 전공과목 for(int i = 0;i<profIdList.size();i++) {
		// 교양과목--------------------------------------
		for (int i = 0; i < geSubjList.size(); i++) {
			// --------------------------------------------
			DataGeneratorLectureVO lvo = new DataGeneratorLectureVO();
			String slyCd = sylPrefix + String.format("%04d", i + 2000);
			String profId = profIdList.get(random.nextInt(profIdList.size())).getProfCd();

			// String subjCd =
			// subjListSelectByProfCd.get(random.nextInt(subjListSelectByProfCd.size()));
			// 교양과목

			String subjCd = geSubjList.get(i);
			String applyStatusCd = "ok";
			/*
			 * if(random.nextFloat()<0.5) { approved = "ing"; }else
			 * if(random.nextFloat()<0.9) { approved="ok"; }else { approved = "nok"; }
			 */
			lvo.setSylCd(slyCd);
			lvo.setMaxStuNum((random.nextInt(10) + 3) * 10);
			lvo.setApplyStatusCd(applyStatusCd);
			lvo.setProfId(profId);
			lvo.setSubjCd(subjCd);
			lvo.setOutline("음악의 기초를 배웁니다.");
			lvo.setLecHour(random.nextInt(4) + 45);
			lvo.setMaterials("음악, 노트북");
			lvo.setEvalClassCd(evalClassCd[random.nextInt(evalClassCd.length)]);
			int startIndx = random.nextInt(startTime.length);
			String lecDate1 = day[random.nextInt(day.length)] + " " + startTime[startIndx] + " - "
					+ endTime[startIndx + random.nextInt(2) + 1];
			String lecDate2 = day[random.nextInt(day.length)] + " " + startTime[startIndx] + " - "
					+ endTime[startIndx + random.nextInt(2) + 1];
			if (lecDate1.equals(lecDate2)) {
				lecDate2 = day[random.nextInt(day.length)] + " " + startTime[startIndx] + " - "
						+ endTime[startIndx + random.nextInt(2) + 1];
			}
			lvo.setLecDate1(lecDate1);
			lvo.setLecDate2(lecDate2);
			lvo.setClassroom(classroom[random.nextInt(classroom.length)]);
			lvo.setSemeCd("202201");
			dgdao.insertIntoSyllabus(lvo);
		}
		model.addAttribute("check", "success");
		return url;
	}

	@RequestMapping("/openlec")
	public String openLec(Model model) {
		String url = "check";
		List<String> openLecSylList = dgdao.selectListOpenLecFromSyllabus();
		for (String openLecSyl : openLecSylList) {
			String lecCd = openLecSyl;
			if (lecCd.equals("SYL0001") || lecCd.equals("SYL0002")) {
				continue;
			}
			DataGeneratorLectureVO lvo = new DataGeneratorLectureVO();
			lvo.setLecCd(lecCd);
			dgdao.insertIntoLecOpen(lvo);
		}
		model.addAttribute("check", "success");
		return url;
	}

	@RequestMapping("/lec")
	public String lec(Model model) {
		String url = "check";
		List<String> stuList = dgdao.selectStudentList();
		List<String> openLecList = dgdao.selectListOpenLecFromLecOpen();
		List<Integer> maxNumList = dgdao.selectMaxStuNum();
		List<String> slyList = dgdao.selectSylCd();
		int[] stuMaxApplyCreditList=new int[stuList.size()];
		for(int i=0;i<stuList.size();i++) {
			String maxApplyCredit = dgdao.selectMaxCreditbyStuCdSemeCd(stuList.get(i));
			stuMaxApplyCreditList[i] = Integer.parseInt(maxApplyCredit);
		}
		int[] stuNum = new int[openLecList.size()];
		String[] gradeseme = { "0101", "0102", "0201", "0202", "0301", "0302", "0401", "0402" };// 1 2 3 4 학년
		for (String stuCd : stuList) {
			
			if(stuCd.equals("mimi")||stuCd.equals("hi")) {
				continue;
			}
			List<String> takenList = dgdao.selectLecCdByStuCd(stuCd);
			int randomGradeSemeCnt = random.nextInt(8)+1;
			int[] randomLecCnt = new int[randomGradeSemeCnt];
			int lecSumCnt = 0;
			for (int i = 0; i < randomLecCnt.length; i++) {
				randomLecCnt[i] = random.nextInt(5) + 4;
				lecSumCnt += randomLecCnt[i];
			}
			Set<String> lecCdSet = new HashSet<String>();
			for(int i=0;i<takenList.size();i++) {
				lecCdSet.add(takenList.get(i));
			}
			while (lecCdSet.size() < lecSumCnt) {
				int ranIndexNum = random.nextInt(openLecList.size());
				lecCdSet.add(openLecList.get(ranIndexNum));
			}
			List<String> lecCdSetList = new ArrayList<String>(lecCdSet);
			Collections.shuffle(lecCdSetList);
			int index = 0;
			for (int i = 0; i < randomGradeSemeCnt; i++) {
				for(int j = 0;j<randomLecCnt[i];j++) {
					DataGeneratorVO dgv = new DataGeneratorVO();
					String lecCd = lecCdSetList.get(index);
					dgv.setLecCd(lecCd);
					dgv.setStuCd(stuCd);
					if (random.nextFloat() > 0.1) {
						dgv.setMylecStatusCd("s");
					} else {
						dgv.setMylecStatusCd("w");
					}
					dgv.setGradeSemeCd(gradeseme[i]);
					index++;
					int lecIndex = openLecList.indexOf(lecCd);
					int preStuNum = stuNum[lecIndex];
					if(preStuNum>=maxNumList.get(lecIndex)) {
						continue;
					}else {
						stuNum[lecIndex]++;
					}
					dgdao.insertIntoLec(dgv);
				}
			}
		}
		for(int i=0;i<slyList.size();i++) {
			DataGeneratorVO dgv = new DataGeneratorVO();
			dgv.setStuNum(stuNum[i]);
			dgv.setLecCd(openLecList.get(i));
			dgdao.updateLecOpen(dgv);
		}
		model.addAttribute("check", "success");
		return url;
	}
	
	
	@RequestMapping("/majorsemester")
	public String majorSemester(Model model) {
		String url = "check";
		
		List<String> majorList = dgdao.selectListMajor();
		int[] maxPersonnel = {30,45,50,55,60,65,70,75,80,85,90,95,100};
		for(String major : majorList) {
			if(major.equals("MAJ0002")) {
				continue;
			}
			DataGeneratorVO dgv = new DataGeneratorVO();
			dgv.setSemeCd("202202");
			dgv.setMajorCd(major);
			dgv.setInPersonnel(0);
			dgv.setOutPersonnel(0);
			dgv.setMaxPersonnel(random.nextInt(maxPersonnel.length));
			dgv.setGradMinCredit(random.nextInt(20)+140);
			dgv.setMinReqCredit(random.nextInt(15)+45);
			dgv.setMjElecCredit(random.nextInt(15)+30);
			dgv.setGeReqCredit(random.nextInt(15)+30);
			dgv.setGeElecCredit(random.nextInt(15)+30);
			dgv.setLecApplyMax(random.nextInt(5)+18);
			dgdao.insertIntoMajorSeme(dgv);
		}
		
		
		
		model.addAttribute("check", "success");
		return url;
	}

	@RequestMapping("/bookhistorygenerate")
	public String BookHistory(Model model) {
		String url = "check";

		model.addAttribute("check", "success");
		return url;

	}
	
	@RequestMapping("/surveyanswer")
	public String surveyanswer(Model model) {
		String url = "check";
		List<String> stuList = dgdao.selectStudentList();
		for(String student : stuList) {
			for(int i=0;i<10;i++) {
				DataGeneratorVO dgv = new DataGeneratorVO();
				dgv.setStuCd(student);
				dgv.setSurveyNo(i+1);
				dgv.setResponse(random.nextInt(5)+1+"");
				dgdao.insertIntoSurveyForm(dgv);
			}
		}
		
		model.addAttribute("check", "success");
		return url;
	}
	
	@RequestMapping("/changeName")
	public String changeName(Model model) {
		String url = "check";
		
		List<DataGeneratorVO> stuList = dgdao.selectStuList();
		List<DataGeneratorVO> profList = dgdao.selectListProf();
		for(DataGeneratorVO student:stuList) {
			String stuCd = student.getStuCd();
			DataGeneratorVO member = dgdao.selectMemberByMemId(stuCd);
			dgdao.updateStudentName(member);
		}
		for(DataGeneratorVO prof:profList) {
			String profCd = prof.getProfCd();
			DataGeneratorVO member = dgdao.selectMemberByMemId(profCd);
			dgdao.updateProfName(member);
		}
		
		
		return url;
	}
}
