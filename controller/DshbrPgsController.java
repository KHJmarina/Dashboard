package dashboard.web.pgs.controller;


import dashboard.web.pgs.model.DshbrPgs;
import dashboard.web.pgs.service.DshbrPgsService;
import lims.web.com.frame.ajax.CommonData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/dshBr")
public class DshbrPgsController {

    @Resource(name = "dshBrPgsService")
    DshbrPgsService dshBrPgsService;

    /**
     * Pgs 주문등록량 화면
     */
    @RequestMapping(value = "/pgs/retrievePgsRgsnCntForm.do")
    public String retrievePgsRgsnCntForm() {
        return "pgs/retrievePgsRgsnCntForm";
    }

    /**
     * Pgs 주문등록량 조회
     */
    @RequestMapping(value = "/pgs/retrievePgsRgsnCnt.do")
    public String retrievePgsRgsnCnt(Model model, CommonData commonData) {
        DshbrPgs dshbrPgs = commonData.get("pgsRgsnCntForm", DshbrPgs.class);

        model.addAttribute("result", dshBrPgsService.retrievePgsRgsnCnt(dshbrPgs));
        return "jsonView";
    }

    /**
     * Pgs 주문등록량 메인
     */
    @RequestMapping(value = "/pgs/retrievePgsRgsnCntMain.do")
    public String retrieveChpCmplCntMain (Model model, CommonData commonData) {
        DshbrPgs dshbrPgs = commonData.getJson(DshbrPgs.class);

        model.addAttribute("result", dshBrPgsService.retrieveChpCmplCntMain(dshbrPgs));
        return "jsonView";
    }


    /**
     * Pgs 주문등록량 화면
     */
    @RequestMapping(value = "/pgs/retrievePgsCmplCntForm.do")
    public String retrievePgsCmplCntForm() {
        return "pgs/retrievePgsCmplCntForm";
    }

    /**
     * Pgs 주문완료량 조회
     */
    @RequestMapping(value = "/pgs/retrievePgsCmplCnt.do")
    public String retrievePgsCmplCnt(Model model, CommonData commonData) {
        DshbrPgs dshbrPgs = commonData.get("pgsCmplCntForm", DshbrPgs.class);

        model.addAttribute("result", dshBrPgsService.retrievePgsCmplCnt(dshbrPgs));
        return "jsonView";
    }

    /**
     * Pgs 주문등록량 메인
     */
    @RequestMapping(value = "/pgs/retrievePgsCmplCntMain.do")
    public String retrievePgsCmplCntMain (Model model, CommonData commonData) {
        DshbrPgs dshbrPgs = commonData.getJson(DshbrPgs.class);

        model.addAttribute("result", dshBrPgsService.retrievePgsCmplCntMain(dshbrPgs));
        return "jsonView";
    }
}
