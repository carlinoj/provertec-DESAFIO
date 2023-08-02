package br.com.provertec.desafioprover.service;


import br.com.provertec.desafioprover.model.Membro;
import br.com.provertec.desafioprover.repository.IMembroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MembroService {

    @Autowired
    IMembroRepository membroRepository;

    public List<Membro> getAll(){

        return new ArrayList<>(membroRepository.findAll());
    }

    public Membro getById(Long id){
        return membroRepository.findById(id).get();
    }

    public boolean saveOrUpdate(Membro membro){
        Membro updatedMembro =  membroRepository.save(membro);

        if (membroRepository.findById(updatedMembro.getId()).isPresent()) return true;
        else{
            return false;
        }

    }

    public boolean deleteById(Long id){
        membroRepository.deleteById(id);

        if (membroRepository.findById(id).isPresent()){
            return true;
        }else{
            return false;
        }


    }
}
