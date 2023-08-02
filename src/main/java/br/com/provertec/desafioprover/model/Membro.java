package br.com.provertec.desafioprover.model;

import br.com.provertec.desafioprover.repository.dto.MembroRequestDTO;
import jakarta.persistence.*;
import lombok.*;

@Entity(name="membro")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="id")
@Table(name="membro")
public class Membro {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    private String cargo;
    @ManyToOne
    private Project project;

    public Membro(MembroRequestDTO data){
        this.nome = data.nome();
        this.cargo = data.cargo();
        this.project = new Project();
        this.project.setId(data.id());
    }
}
