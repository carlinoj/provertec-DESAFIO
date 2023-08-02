package br.com.provertec.desafioprover.controller;


import br.com.provertec.desafioprover.model.Membro;
import br.com.provertec.desafioprover.repository.dto.MembroRequestDTO;
import br.com.provertec.desafioprover.repository.dto.MembroResponseDTO;
import br.com.provertec.desafioprover.repository.IMembroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("projects")
public class MembroController {
    @Autowired
    private IMembroRepository repository;

    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @PostMapping
    public void insertProject(@RequestBody MembroRequestDTO data){
        Membro membroData = new Membro(data);
        repository.save(membroData);
    }

    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @GetMapping
    public List<MembroResponseDTO> getAll(){
        List<MembroResponseDTO> projectList = repository.findAll().stream().map(MembroResponseDTO::new).collect(Collectors.toList());
        return projectList;
    }
}
