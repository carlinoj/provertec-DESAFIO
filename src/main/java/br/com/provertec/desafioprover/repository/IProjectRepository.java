package br.com.provertec.desafioprover.repository;

import br.com.provertec.desafioprover.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
public interface IProjectRepository extends JpaRepository<Project, Long>{

}
