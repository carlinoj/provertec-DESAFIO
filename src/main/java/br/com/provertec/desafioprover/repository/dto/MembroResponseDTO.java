package br.com.provertec.desafioprover.repository.dto;

import br.com.provertec.desafioprover.model.Membro;

public record MembroResponseDTO(Long id, String nome, String cargo, Long idCargo) {
    public MembroResponseDTO(Membro membro){
        this(membro.getId(), membro.getNome(), membro.getCargo(), membro.getProject().getId());
    }
}
