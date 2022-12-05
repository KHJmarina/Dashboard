package dashboard.web.ngs.controller;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dashboard.web.ngs.model.DshbrNgs;
import dashboard.web.ngs.model.DshbrNgsApplication;
import dashboard.web.ngs.model.DshbrNgsConst;
import dashboard.web.ngs.service.DshbrNgsService;
import lims.web.com.frame.ajax.CommonData;
import lims.web.com.frame.service.Globals;

@Controller
@RequestMapping(value ="/dshBr")
public class DshbrNgsController {

	@Resource(name = "dshbrNgsService")
	DshbrNgsService dshbrNgsService;

	/**
	 * 어플리케이션별 컴플리트 준수 총 카운트
	 * @return
	 */
	@RequestMapping(value = "/ngs/retrieveNgsApplionCmplCntForm.do")
	public String retrieveNgsApplionCmplCntForm(){
		return "ngs/retrieveNgsApplionCmplCntForm";
	}

	/**
	 * 플랫폼별 플레이트 컴플리트 카운트 페이지
	 * @return
	 */
	@RequestMapping(value = "/ngs/retrieveNgsPlateCmplCntForm.do")
	public String retrieveNgsPlateCmplCntForm(){
		return "ngs/retrieveNgsPlateCmplCntForm";
	}


	/**
	 * 플랫폼별 플레이트 컴플리트 카운트 리스트
	 * @return
	 */
	@RequestMapping(value = "/ngs/retrieveNgsPlateCmplCnt.do")
	public String plateCmplCntList(Model model , CommonData commonData){
		DshbrNgs dshbrNgs = commonData.get("ngsPlateSrchForm", DshbrNgs.class);
		//NGS 플랫폼 리스트 넣어주기
		dshbrNgs.setNgsPlate(DshbrNgsConst.NgsPlate);

		//일별 조회
		if(dshbrNgs.getStatType().equals("daily")) {
			dshbrNgs.setSearchDailyDate(dshbrNgs.getSearchDailyDate().replaceAll("-", ""));
			model.addAttribute("dailyList",dshbrNgsService.retrieveNgsPlateCmplCntDay(dshbrNgs));
		}

		//주별 조회
		else if(dshbrNgs.getStatType().equals("weekly")) {
			dshbrNgs.setSearchDailyDate(dshbrNgs.getSearchDailyDate().replaceAll("-", ""));
			model.addAttribute("weeklyList",dshbrNgsService.retrieveNgsPlateCmplCntWeek(dshbrNgs));
		}

		//년별 조회
		else if(dshbrNgs.getStatType().equals("monthly")) {
			String searchMonthDate = dshbrNgs.getSearchDailyDate().replaceAll("-", "").substring(0,6);
			dshbrNgs.setSearchMonthDate(searchMonthDate);
			dshbrNgs.setMainYn("N");
			model.addAttribute("monthlyList",dshbrNgsService.retrieveNgsPlateCmplCntMonth(dshbrNgs));
		}
		return "jsonView";
	}

	/**
	 * 플랫폼별 플레이트 컴플리트 메인 페이지
	 * @return
	 */
	@RequestMapping(value = "/ngs/ngsPlateCmplCntMain.do")
	public String ngsPlateCmplCntMain(Model model , CommonData commonData){
		DshbrNgs dshbrNgs = commonData.get("ngsPlateSrchForm", DshbrNgs.class);
		dshbrNgs.setNgsPlate(DshbrNgsConst.NgsPlate);
		if(dshbrNgs.getSysDay().equals("01")) {
			ZonedDateTime now = ZonedDateTime.now(Globals.ACTIVE_ZONE_ID);
			now = now.minusMonths(1);
			dshbrNgs.setSearchMonthDate(now.format(DateTimeFormatter.ofPattern("yyyyMM")));
		}
		else {
			dshbrNgs.setSearchMonthDate(dshbrNgs.getSysYm());
		}
		dshbrNgs.setMainYn("Y");
		model.addAttribute("monthlyList",dshbrNgsService.retrieveNgsPlateCmplCntMonth(dshbrNgs));
		return "jsonView";
	}


	/**
	 * 플랫폼별 플레이트 컴플리트 카운트 리스트
	 * @return
	 */
	@RequestMapping(value = "/ngs/applionCmplCntList.do")
	public String applionCmplCntList(Model model , CommonData commonData){
		DshbrNgs dshbrNgs = commonData.get("ngsPlateSrchForm", DshbrNgs.class);
		model.addAttribute("result",dshbrNgsService.applionCmplCntList(dshbrNgs));
		return "jsonView";
	}

	/**
	 * NGS Application 조회(메인)
	 * @return
	 */
	@RequestMapping(value = "/ngs/retrieveNgsApplicationSttcMain.do")
	public String retrieveNgsApplicationSttcMain(Model model , CommonData commonData) {
		DshbrNgsApplication dshbrNgs = commonData.get("ngsPlateSrchForm", DshbrNgsApplication.class);

		model.addAttribute("result",dshbrNgsService.retrieveNgsApplicationSttcMain(dshbrNgs));
		return "jsonView";
	}

	/**
	 * NGS Application 조회(상세)
	 * @return
	 */
	@RequestMapping(value = "/ngs/retrieveNgsApplicationSttc.do")
	public String retrieveNgsApplicationSttc(Model model , CommonData commonData) {
		DshbrNgsApplication dshbrNgs = commonData.get("ngsApplionSrchForm", DshbrNgsApplication.class);
		model.addAttribute("result",dshbrNgsService.retrieveNgsApplicationSttc(dshbrNgs));
		return "jsonView";
	}
}
