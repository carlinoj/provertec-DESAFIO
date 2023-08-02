import "./card.css";
import { format } from "date-fns";

interface cardProps {
  id: number;
  nome: string;
  inicio: string;
  gerente: string;
  prevFim: string;
  realFim: string;
  orcamento: number;
  descricao: string;
  status: string;
}

export function Card({
  id,
  nome,
  inicio,
  gerente,
  prevFim,
  realFim,
  orcamento,
  descricao,
  status,
}: cardProps) {
  return (
    <div className="card">
      <h2>{nome}</h2>
      <ul>
        <li className="hide">{id}</li>
        <li><b>Data de início:</b>
            {" "}{inicio ? format(new Date(inicio), "dd/MM/yyyy"): "Data de início não disponível"}
        </li>
        <li>
          <b>Gerente responsável:</b> {gerente}
        </li>
        <li>
          <b>Previsão de término:</b>
          {" "}{prevFim ? format(new Date(prevFim), "dd/MM/yyyy"): "Previsão de término não disponível"}
        </li>
        <li>
          <b>Data real de término:</b>
          {" "}{realFim ? format(new Date(realFim), "dd/MM/yyyy"): "Data real de término não disponível"}
        </li>
        <li>
          <b>Orçamento total:</b> {orcamento}
        </li>
        <li>
          <b>Descricao:</b> {descricao}
        </li>
        <li>
          <b>Status:</b> {status}
        </li>
      </ul>
    </div>
  );
}
