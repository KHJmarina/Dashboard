package dashboard.web.chp.controller;

import javax.annotation.Resource;

import lims.web.comm.sheetCol.model.UserSheetCol;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dashboard.web.chp.model.DshbrChp;
import dashboard.web.chp.service.DshbrChpService;
import lims.web.com.frame.ajax.CommonData;

@Controller
@RequestMapping(value ="/dshBr")
public class DshbrChpController {

    @Resource(name = "dshbrChpService")
    DshbrChpService dshbrChpService;

    /**
     * CHP 장비 가동률 화면
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/chp/retrieveChpCmplCntForm.do")
    public String retrieveChpCmplCntForm(){
        return "chp/retrieveChpCmplCntForm";
    }


    /**
     * 장비별 칩 카운트 조회
     * @return
     */
    @RequestMapping(value = "/chp/retrieveChpCmplCnt.do")
    public String retrieveChpCmplCnt (Model model, CommonData commonData) {
        DshbrChp dshbrChp = commonData.get("chpCmplCntForm", DshbrChp.class);

        model.addAttribute("result", dshbrChpService.retrieveChpCmplCnt(dshbrChp));
        return "jsonView";
    }

    @RequestMapping(value = "/chp/retrieveWeekNum.do")
    public String retrieveWeekNum (Model model, CommonData commonData) {
        DshbrChp dshbrChp = commonData.getJson(DshbrChp.class);
        String weekName = dshbrChpService.retrieveWeekNum(dshbrChp);

        model.addAttribute("weekName", weekName);
        return "jsonView";
    }

    /**
     * CHP 기기 가동률(메인)
     * @return
     */
    @RequestMapping(value = "/chp/retrieveChpCmplCntMain.do")
    public String retrieveChpCmplCntMain (Model model, CommonData commonData) {
        DshbrChp dshbrChp = commonData.get("chpCmplCntForm", DshbrChp.class);

        model.addAttribute("result", dshbrChpService.retrieveChpCmplCntMain(dshbrChp));
        model.addAttribute("currMonth",dshbrChp.getSysYm());
        return "jsonView";
    }



}
