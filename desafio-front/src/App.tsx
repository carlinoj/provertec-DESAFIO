import { useState } from 'react'
import './App.css'
import { Card } from './components/card/card';
import { useProjectData } from './hooks/useProjectData';

function App() {

const {data} = useProjectData();

  return (
    <main className="container">
      <header>
        <h1>Desafio Prover</h1>
        <h3>Projetos Cadastrados</h3>
      </header>
      <hr/>

      <div className="card-grid">
        {data?.map(projectData => 
                                  <Card  
                                        id={projectData.id} 
                                        nome={projectData.nome} 
                                        inicio={projectData.inicio}
                                        gerente={projectData.gerente}
                                        prevFim={projectData.prevFim}
                                        realFim={projectData.realFim}
                                        orcamento={projectData.orcamento}
                                        descricao={projectData.descricao}
                                        status={projectData.status}
                                  />
                  )
          }
      </div>

    </main>
  )
}

export default App
