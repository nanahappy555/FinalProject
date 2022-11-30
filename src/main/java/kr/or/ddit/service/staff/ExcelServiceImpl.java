package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.command.PageMakerLec;
import kr.or.ddit.dao.staff.ExcelDAO;
import kr.or.ddit.dto.staff.ExcelVO;
import lombok.extern.slf4j.Slf4j;



@Service
@Slf4j
public class ExcelServiceImpl implements ExcelService {

	@Autowired
	private ExcelDAO excelDAO;
	public void setExcelDAO(ExcelDAO excelDAO) {
		this.excelDAO = excelDAO;
	}
	
	@Override
	public Map<String, Object> getUserRegistList(CriteriaLec cri) throws SQLException {
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ExcelVO> eList = excelDAO.selectUserRegistList(cri);
		
		int totalCount = excelDAO.selectExcelTotalCount(cri);
		
		PageMakerLec pageMaker = new PageMakerLec();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("selectUserRegistList", eList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
	@Override
	public void insertExcelMember(Map<String, String> mapData) throws SQLException {
		String birthday = mapData.get("birthday");
		birthday = birthday.replaceAll("[^0-9]", "");
		
		
		log.debug("비밀번호" + birthday);
		mapData.put("memPwd", birthday);
		mapData.put("memClassCd", "stu");
		
		excelDAO.insertExcelMember(mapData);
	}
	
	@Override
	public void insertExcelStudent(Map<String, String> mapData) throws SQLException {

		excelDAO.insertExcelStudent(mapData);			
	}

	@Override
	public void insertExcelStuMajor(Map<String, String> mapData) throws SQLException {
		
	
		String [] majorCdList = {
				"MJR0003",
				"MJR0004",
				"MJR0005",
				"MJR0006",
				"MJR0007",
				"MJR0008",
				"MJR0009",
				"MJR0010",
				"MJR0011",
				"MJR0012",
				"MJR0013",
				"MJR0014",
				"MJR0015",
				"MJR0016",
				"MJR0017",
				"MJR0018",
				"MJR0019",
				"MJR0020",
				"MJR0021",
				"MJR0022",
				"MJR0023",
				"MJR0024",
				"MJR0025",
				"MJR0026",
				"MJR0027",
				"MJR0028",
				"MJR0029",
				"MJR0030",
				"MJR0031",
				"MJR0032",
				"MJR0033",
				"MJR0034",
				"MJR0035",
				"MJR0036",
				"MJR0037",
				"MJR0038",
				"MJR0039",
				"MJR0040",
				"MJR0041",
				"MJR0042",
				"MJR0043",
				"MJR0044",
				"MJR0045",
				"MJR0046",
				"MJR0047",
				"MJR0048",
				"MJR0049",
				"MJR0050",
				"MJR0051",
				"MJR0052",
				"MJR0053",
				"MJR0054",
				"MJR0055",
				"MJR0056",
				"MJR0057",
				"MJR0058",
				"MJR0059",
				"MJR0060",
				"MJR0061",
				"MJR0062",
				"MJR0063",
				"MJR0064",
				"MJR0065",
				"MJR0066",
				"MJR0067",
				"MJR0068",
				"MJR0069",
				"MJR0070",
				"MJR0071",
				"MJR0072",
				"MJR0073",
				"MJR0074",
				"MJR0075",
				"MJR0076",
				"MJR0077",
				"MJR0078",
				"MJR0079",
				"MJR0080",
				"MJR0081",
				"MJR0082",
				"MJR0083",
				"MJR0084",
				"MJR0085",
				"MJR0086",
				"MJR0087",
				"MJR0088",
				"MJR0089",
				"MJR0090",
				"MJR0091",
				"MJR0092",
				"MJR0093",
				"MJR0094",
				"MJR0095",
				"MJR0096",
				"MJR0097",
				"MJR0098",
				"MJR0099"};
		String[] majorNameList= {
				"기계공학과",
				"제어계측공학과" ,
				"항공우주공학과 " ,
				"자동차공학과" ,
				"철도공학과" ,
				"조선해양공학과 " ,
				"농업기계공학과" ,
				"로봇공학과" ,
				"전자공학과 " ,
				"전기공학과" ,
				"전기전자공학과" ,
				"원자력공학과" ,
				"고분자공학과" ,
				"섬유공학과" ,
				"무기재료공학과" ,
				"세라믹공학과" ,
				"금속공학과" ,
				"생명공학과" ,
				"언어학" ,
				"국어 국문학" ,
				"러시아어" ,
				"스페인어" ,
				"중국어" ,
				"영어" ,
				"영문학" ,
				"일본어" ,
				"프랑스어" ,
				"문예창작" ,
				"철학" ,
				"윤리학" ,
				"역사" ,
				"고고학" ,
				"종교학" ,
				"문화" ,
				"민속" ,
				"미술사학" ,
				"국제지역학" ,
				"교양인문학" ,
				"농업학" ,
				"수산학" ,
				"산림·원예학" ,
				"생명과학" ,
				"생물학" ,
				"동물·수의학" ,
				"자원학" ,
				"화학" ,
				"환경학" ,
				"가정관리학" ,
				"식품영양학" ,
				"의류·의상학" ,
				"교양생물과학" ,
				"수학" ,
				"통계학" ,
				"물리·과학" ,
				"천문·기상학" ,
				"지구·지리학" ,
				"교양자연과학" ,
				"의학 " ,
				"치의학" ,
				"한의학" ,
				"약학" ,
				"재활학" ,
				"의료공학" ,
				"음악대학" ,
				"연극학과" ,
				"영화영상학과" ,
				"공연제작과" ,
				"모델과" ,
				"사진학과" ,
				"게임학과" ,
				"만화애니메이션학과" ,
				"미용학과" ,
				"교회음악과" ,
				"성악과" ,
				"경영정보학과" ,
				"경영학과" ,
				"글로벌테크노경영전공" ,
				"IT경영전공" ,
				"산업경영전공" ,
				"회계학" ,
				"관광경영학과" ,
				"관광호텔경영학부" ,
				"금융학과" ,
				"회계학과" ,
				"경제통상학부" ,
				"세무경영학과" ,
				"세무학과" ,
				"광고홍보이벤트학과 " ,
				"광고홍보학과" ,
				"광고홍보학부" ,
				"행정학" ,
				"사회복지학" ,
				"사회학" ,
				"문화인류학" ,
				"언론홍보영상학" ,
				"지역학협동" ,
				"법학과 " ,
		};
		
		String colCd[] = {
				"CLG0002",
				"CLG0003",
				"CLG0004",
				"CLG0005",
				"CLG0006",
				"CLG0007",
				"CLG0008",
				"CLG0009",
				"CLG0010",
				"CLG0011",
				"CLG0012",
				"CLG0013",
				"CLG0001",
		};
		String [] colName= {
				"인문대학",
				"이과대학",
				"의과대학",
				"예술대학",
				"경영대학",
				"사회과학대학",
				"법과대학",
				"생명과학대학",
				"정경대학",
				"사범대학",
				"간호대학",
				"국제대학",
				"공학대학",
		};
		
		Map<String,String> stuMajorMap = new HashMap<String,String>();
		String majorName = mapData.get("majorName");
		String stuCd = (String)mapData.get("stuCd");
		String stuMajorCd = stuCd+excelDAO.selectStuMajorCdNextVal();
		stuMajorMap.put("majorName",majorName);
		stuMajorMap.put("stuMajorCd", stuMajorCd);
		stuMajorMap.put("stuCd", stuCd);
		excelDAO.insertExcelStuMajor(stuMajorMap);
	}

	@Override
	public List<ExcelVO> selectCollegeList() throws SQLException {
		
		return excelDAO.selectCollegeList();
	}

}
