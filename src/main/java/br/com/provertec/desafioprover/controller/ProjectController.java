package br.com.provertec.desafioprover.controller;


import br.com.provertec.desafioprover.model.Project;
import br.com.provertec.desafioprover.service.ProjectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;

@Controller
public class ProjectController {


    private final ProjectService projectService;

    public ProjectController(ProjectService projectService){
        this.projectService = projectService;
    }

    private static final String ATTRIBUTE = "message";
    private static final String ERROR = "error";
    private static List<String> riscoOptions = Arrays.asList("Baixo Risco", "Médio Risco", "Alto Risco");
    private static List<String> statusOptions = Arrays.asList("em análise", "análise realizada", "análise aprovada", "iniciado", "planejado", "em andamento", "encerrado", "cancelado");

    @GetMapping({"/","/viewProjectList"})
    public String viewProjectList(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("projectList", projectService.getAll());
        model.addAttribute(ATTRIBUTE, message);

        return "ViewProjectList";
    }

    @GetMapping("/addProject")
    public String addProject(@ModelAttribute("message") String message, Model model){
        model.addAttribute("riscoOptions",riscoOptions);
        model.addAttribute("project",new Project());
        model.addAttribute(ATTRIBUTE,message);

        return "AddProject";
    }

    @PostMapping("/saveProject")
    public String saveProject(Project project, RedirectAttributes redirectAttributes){
        if(projectService.saveOrUpdate(project)){
            redirectAttributes.addFlashAttribute(ATTRIBUTE,"Save Success");

            return "redirect:/viewProjectList";
        }
        redirectAttributes.addFlashAttribute(ATTRIBUTE,ERROR);
        return "redirect:/addProject";
    }

    @GetMapping("/editProject/{id}")
    public String editProject(@PathVariable Long id, Model model){
        model.addAttribute("riscoOptions",riscoOptions);
        model.addAttribute("statusOptions",statusOptions);
        model.addAttribute("project", projectService.getById(id));
        return "editProject";
    }


    @PostMapping("/editSaveProject")
    public String editSaveProject(Project project, RedirectAttributes redirectAttributes){
        if(projectService.saveOrUpdate(project)){
            redirectAttributes.addFlashAttribute(ATTRIBUTE,ERROR);

            return "redirect:/viewProjectList";
        }

        redirectAttributes.addFlashAttribute(ATTRIBUTE,ERROR);
        return "redirect:/editProject/" + project.getId();
    }

    @GetMapping("/delete/{id}")
    public String deleteProject(@PathVariable Long id, RedirectAttributes redirectAttributes){
        if(projectService.deleteById(id)){
            redirectAttributes.addFlashAttribute(ATTRIBUTE,"Delete Success");
        } else {
            redirectAttributes.addFlashAttribute(ATTRIBUTE,ERROR);
        }


        return "redirect:/viewProjectList";
    }
}
