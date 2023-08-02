package br.com.provertec.desafioprover.model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Table(name="project")
@Entity(name="project")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="id")
public class Project {
    /*trocar o GenerationType para UUID ao ***implantar***, mantido como IDENTITY no dev para facilitar os testes*/
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inicio;
    private String gerente;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="prevfim")
    private Date prevFim;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="realfim")
    private Date realFim;
    private Double orcamento;
    private String descricao;
    private String status;
    private String risco;

}
