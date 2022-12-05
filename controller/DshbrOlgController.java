package dashboard.web.olg.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dashboard.web.olg.model.DshbrOlg;
import dashboard.web.olg.service.DshbrOlgService;
import lims.web.com.frame.ajax.CommonData;

@Controller
@RequestMapping(value ="/dshBr")
public class DshbrOlgController {

	@Resource(name = "dshbrOlgService")
	DshbrOlgService dshbrOlgService;

	/**
	 * OLG 누적 합성량 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/olg/retrieveOlgSynthSttcForm.do")
	public String retrieveOlgSynthSttcForm(){
		return "olg/retrieveOlgSynthSttcForm";
	}

	/**
	 * OLG 재합성율 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/olg/retrieveOlgReSynthSttcForm.do")
	public String retrieveOlgReSynthSttcForm(){
		return "olg/retrieveOlgReSynthSttcForm";
	}

	/**
	 * OLG 누적 합성량 조회
	 * @return
	 */
	@RequestMapping(value = "/olg/retrieveOlgSynthSttc.do")
	public String retrieveOlgSynthSttc(Model model , CommonData commonData) {
		DshbrOlg dshbrOlg = commonData.get("olgSttcSrchForm", DshbrOlg.class);

		model.addAttribute("result",dshbrOlgService.retrieveOlgSynthSttc(dshbrOlg));
		return "jsonView";
	}

	/**
	 * OLG 재합성율 조회
	 * @return
	 */
	@RequestMapping(value = "/olg/retrieveOlgReSynthSttc.do")
	public String retrieveOlgReSynthSttc(Model model , CommonData commonData) {
		DshbrOlg dshbrOlg = commonData.get("olgSttcSrchForm", DshbrOlg.class);

		model.addAttribute("result",dshbrOlgService.retrieveOlgReSynthSttc(dshbrOlg));
		return "jsonView";
	}

	/**
	 * OLG 누적 합성량 조회(메인)
	 * @return
	 */
	@RequestMapping(value = "/olg/retrieveOlgSynthSttcMain.do")
	public String retrieveOlgSynthSttcMain(Model model , CommonData commonData) {
		DshbrOlg dshbrOlg = commonData.getJson(DshbrOlg.class);

		model.addAttribute("result",dshbrOlgService.retrieveOlgSynthSttcMain(dshbrOlg));
		model.addAttribute("currMonth", dshbrOlg.getSysYm());
		return "jsonView";
	}

	/**
	 * OLG 재합성율 조회(메인)
	 * @return
	 */
	@RequestMapping(value = "/olg/retrieveOlgReSynthSttcMain.do")
	public String retrieveOlgReSynthSttcMain(Model model , CommonData commonData) {
		DshbrOlg dshbrOlg = commonData.getJson(DshbrOlg.class);

		model.addAttribute("result",dshbrOlgService.retrieveOlgReSynthSttcMain(dshbrOlg));
		model.addAttribute("currMonth", dshbrOlg.getSysYm());
		return "jsonView";
	}
}
