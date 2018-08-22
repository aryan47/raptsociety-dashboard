package com.project.ritesh.dashboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.ritesh.dashboard.configuration.BasicConfiguration;
import com.project.ritesh.dashboard.entity.Student;
import com.project.ritesh.dashboard.repository.StudentRepository;

@Controller
public class IndexController {
	@Autowired
	StudentRepository studentRepo;
	@Autowired
	BasicConfiguration basic;
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/tables")
	public String table(ModelMap map) {
		map.addAttribute("url",basic.getUrl());
		return "tables";
	}
	@GetMapping("/addStudent")
	public String addStudent(Student student, RedirectAttributes red) {
		//impement password field
		String name=studentRepo.addStudent(student);
		red.addFlashAttribute("studentAdded",name);
		
		return "redirect:/tables";
	}
	@GetMapping("/updateStudent")
	public String updateStudent( Student update,RedirectAttributes red) {
		System.out.println(update.getName());
		String name= studentRepo.updateStudent(update);
		red.addFlashAttribute("studentUpdated", name);
		return "redirect:/tables";
	}
}
