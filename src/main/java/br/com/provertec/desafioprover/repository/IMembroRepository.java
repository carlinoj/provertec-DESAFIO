package br.com.provertec.desafioprover.repository;

import br.com.provertec.desafioprover.model.Membro;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IMembroRepository extends JpaRepository<Membro, Long>{

}
