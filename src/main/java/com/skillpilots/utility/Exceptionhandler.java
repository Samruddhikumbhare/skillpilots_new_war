package com.skillpilots.utility;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;

public class Exceptionhandler {
	@RequestMapping(value = "/error", method = RequestMethod.GET)
    public ModelAndView renderErrorPage(HttpServletRequest httpRequest) {
        ModelAndView errorPage = new ModelAndView("errorPage");
        String errorMsg = "";
        int httpErrorCode = getErrorCode(httpRequest);
        String utype = "";

       

        switch (httpErrorCode) {
            case 400:
                errorMsg = MessageConstants.err_four_hundred;
                break;
            case 401:
                errorMsg = MessageConstants.err_four_zero_one;
                break;
            case 404:
                errorMsg = MessageConstants.err_four_zero_four;
                break;
            case 405:
                errorMsg = MessageConstants.err_four_zero_five;
                break;
            case 500:
                errorMsg = MessageConstants.err_five_hundred;
                break;
            default:
                errorMsg = MessageConstants.err_default_msg;
        }

        errorPage.addObject("errorCode", httpErrorCode);
        errorPage.addObject("errorMsg", errorMsg);
        return errorPage;
    }

    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest.getAttribute("javax.servlet.error.status_code");
    }
}
