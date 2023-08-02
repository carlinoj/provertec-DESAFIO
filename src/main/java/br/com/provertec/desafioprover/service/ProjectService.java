package br.com.provertec.desafioprover.service;


import br.com.provertec.desafioprover.model.Project;
import br.com.provertec.desafioprover.repository.IProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProjectService {

    @Autowired
    IProjectRepository projectRepository;

    public List<Project> getAll(){

        return new ArrayList<>(projectRepository.findAll());
    }

    public Project getById(Long id){
        return projectRepository.findById(id).get();
    }

    public boolean saveOrUpdate(Project project){
        Project updatedProject =  projectRepository.save(project);

        if (projectRepository.findById(updatedProject.getId()).isPresent()) return true;
        else{
            return false;
        }

    }

    public boolean deleteById(Long id){
        if( projectRepository.getReferenceById(id).getStatus().equals("iniciado")       ||
            projectRepository.getReferenceById(id).getStatus().equals("em andamento")   ||
            projectRepository.getReferenceById(id).getStatus().equals("encerrado")      ){
            return false;
        }

        projectRepository.deleteById(id);

        if (projectRepository.findById(id).isPresent()){
            return true;
        }else{
            return false;
        }


    }
}
