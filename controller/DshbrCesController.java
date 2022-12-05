package dashboard.web.ces.controller;

import javax.annotation.Resource;

import dashboard.web.ces.model.DshbrCes;
import lims.web.com.frame.ajax.CommonData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dashboard.web.ces.service.DshbrCesService;

@Controller
@RequestMapping(value ="/dshBr")
public class DshbrCesController {

	@Resource(name = "dshbrCesService")
	DshbrCesService dshbrCesService;

	/**
	 * CES 기기가동율 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ces/retrieveCesInstrOprSttcForm.do")
	public String retrieveCesInstrOprSttcForm(){
		return "ces/retrieveCesInstrOprSttcForm";
	}

	/**
	 * CES 재반응율 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ces/retrieveCesRrxnSttcForm.do")
	public String retrieveCesRrxnSttcForm(){
		return "ces/retrieveCesRrxnSttcForm";
	}

	/**
	 * CES 완료 반응 수 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ces/retrieveCesCmplRxnSttcForm.do")
	public String retrieveCesCmplRxnSttcForm(){
		return "ces/retrieveCesCmplRxnSttcForm";
	}

	/**
	 * CES 기기가동율 조회
	 * @return
	 */
	@RequestMapping(value = "/ces/retrieveCesInstrOprSttc.do")
	public String retrieveCesInstrOprSttc(Model model , CommonData commonData) {
		DshbrCes dshbrCes = commonData.get("cesSttcSrchForm", DshbrCes.class);

		model.addAttribute("result",dshbrCesService.retrieveCesInstrOprSttc(dshbrCes));
		return "jsonView";
	}

	/**
	 * CES 재반응율 조회
	 * @return
	 */
	@RequestMapping(value = "/ces/retrieveCesRrxnSttc.do")
	public String retrieveCesRrxnSttc(Model model , CommonData commonData) {
		DshbrCes dshbrCes = commonData.get("cesSttcSrchForm", DshbrCes.class);

		model.addAttribute("result",dshbrCesService.retrieveCesRrxnSttc(dshbrCes));
		return "jsonView";
	}

	/**
	 * CES 완료 반응 수 조회
	 * @return
	 */
	@RequestMapping(value = "/ces/retrieveCesCmplRxnSttc.do")
	public String retrieveCesCmplRxnSttc(Model model , CommonData commonData) {
		DshbrCes dshbrCes = commonData.get("cesSttcSrchForm", DshbrCes.class);

		model.addAttribute("result",dshbrCesService.retrieveCesCmplRxnSttc(dshbrCes));
		return "jsonView";
	}

	/**
	 * CES 기기가동율 조회(메인)
	 * @return
	 */
	@RequestMapping(value = "/ces/retrieveCesInstrOprSttcMain.do")
	public String retrieveCesInstrOprSttcMain(Model model , CommonData commonData) {
		DshbrCes dshbrOlg = commonData.getJson(DshbrCes.class);

		model.addAttribute("result",dshbrCesService.retrieveCesInstrOprSttcMain(dshbrOlg));
		model.addAttribute("currMonth", dshbrOlg.getSysYm());
		return "jsonView";
	}

	/**
	 * CES 재반응율 조회(메인)
	 * @return
	 */
	@RequestMapping(value = "/ces/retrieveCesRrxnSttcMain.do")
	public String retrieveCesRrxnSttcMain(Model model , CommonData commonData) {
		DshbrCes dshbrOlg = commonData.getJson(DshbrCes.class);

		model.addAttribute("result",dshbrCesService.retrieveCesRrxnSttcMain(dshbrOlg));
		model.addAttribute("currMonth", dshbrOlg.getSysYm());
		return "jsonView";
	}

	/**
	 * CES 완료 반응 수 조회(메인)
	 * @return
	 */
	@RequestMapping(value = "/ces/retrieveCesCmplRxnSttcMain.do")
	public String retrieveCesCmplRxnSttcMain(Model model , CommonData commonData) {
		DshbrCes dshbrCes = commonData.getJson(DshbrCes.class);

		model.addAttribute("result",dshbrCesService.retrieveCesCmplRxnSttcMain(dshbrCes));
		model.addAttribute("currMonth", dshbrCes.getSysYm());
		return "jsonView";
	}
}
