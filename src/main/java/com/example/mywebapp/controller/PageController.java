package com.example.mywebapp.controller;

import com.example.mywebapp.model.Passcode;
import com.example.mywebapp.service.PasscodeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PageController {

	@Autowired
	private PasscodeService passservice;

    // Show the JSP form
    @GetMapping("/walletpinet")
    public ModelAndView showAddUserForm() {
        return new ModelAndView("addUser");
    }

    // Handle form submission
    @GetMapping("/walletlogin")
    public String saveUser(@RequestParam String passcode,RedirectAttributes redirectAttributes) {
        Passcode passc = new Passcode();
        passc.setPass(passcode);
        passservice.savePasscode(passc);
        redirectAttributes.addFlashAttribute("msg", "Wrong Passcode.! Please Try Again!");
        return "redirect:/walletpinet";
    }
}
