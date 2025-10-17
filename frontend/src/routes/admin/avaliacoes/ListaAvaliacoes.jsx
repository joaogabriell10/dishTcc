import { useEffect, useState } from "react";
import BackendEndPoints from "../../../constants/BackendEndPoints";
import Requisicao from "../../../utils/requisicao/Requisicao";
import Menu from "../../../components/layout/Menu";
import Status from "../../../constants/Status";
import Rodape from "../../../components/layout/Rodape";
import { Link, useNavigate } from "react-router-dom";
import Rotas from "../../../constants/Rotas";
import "./ListaAvaliacoes.css";

export default () => {
  const [avaliacoes, setAvaliacoes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [consulta, setConsulta] = useState("");
  const navigate = useNavigate();

  async function obterAvaliacoes() {
    try {
      setLoading(true);
      const resposta = await Requisicao.obter(BackendEndPoints.avaliacoes.listar);
      setAvaliacoes(resposta.dados);
    } catch (error) {
      console.error("Erro ao carregar avaliações:", error);
    } finally {
      setLoading(false);
    }
  }

  async function deletarAvaliacao(id) {
    if (window.confirm("Tem certeza que deseja deletar esta avaliação?")) {
      try {
        await Requisicao.obter(BackendEndPoints.avaliacoes.deletar(id));
        obterAvaliacoes();
      } catch (error) {
        alert("Erro ao deletar avaliação");
      }
    }
  }

  useEffect(() => {
    obterAvaliacoes();
  }, []);

  const avaliacoesFiltradas = avaliacoes.filter((avaliacao) =>
    avaliacao.produto?.nome?.toLowerCase().includes(consulta.toLowerCase()) ||
    avaliacao.usuario?.email?.toLowerCase().includes(consulta.toLowerCase()) ||
    avaliacao.comentario?.toLowerCase().includes(consulta.toLowerCase()) ||
    String(avaliacao.id).includes(consulta) ||
    String(avaliacao.nota).includes(consulta)
  );

  const renderEstrelas = (nota) => {
    return [...Array(5)].map((_, i) => (
      <span key={i} className={i < nota ? "estrela-ativa" : "estrela-inativa"}>
        ★
      </span>
    ));
  };

  return (
    <div className="admin-page">
      <Menu />
      
      <div className="admin-container">
        <div className="admin-header">
          <h1>Gerenciar Avaliações</h1>
          <p>Administre as avaliações dos produtos</p>
        </div>

        <div className="admin-actions">
          <Link to={Rotas.admin.avaliacoes.adicionar} className="btn-adicionar">
            + Adicionar Avaliação
          </Link>
          
          <div className="search-container">
            <input
              type="text"
              placeholder="Pesquisar por produto, usuário, comentário..."
              value={consulta}
              onChange={(e) => setConsulta(e.target.value)}
              className="search-input"
            />
          </div>
        </div>

        {loading ? (
          <div className="loading-container">
            <div className="loading-spinner"></div>
            <p>Carregando avaliações...</p>
          </div>
        ) : (
          <div className="table-container">
            <table className="admin-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Produto</th>
                  <th>Usuário</th>
                  <th>Nota</th>
                  <th>Comentário</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                {avaliacoesFiltradas.length > 0 ? (
                  avaliacoesFiltradas.map((avaliacao) => (
                    <tr key={avaliacao.id}>
                      <td className="id-cell">{avaliacao.id}</td>
                      <td className="produto-cell">{avaliacao.produto?.nome || 'N/A'}</td>
                      <td className="usuario-cell">{avaliacao.usuario?.email || 'N/A'}</td>
                      <td className="nota-cell">
                        <div className="estrelas">
                          {renderEstrelas(avaliacao.nota)}
                        </div>
                        <span className="nota-numero">({avaliacao.nota})</span>
                      </td>
                      <td className="comentario-cell">
                        <div className="comentario-preview">
                          {avaliacao.comentario?.length > 50 
                            ? `${avaliacao.comentario.substring(0, 50)}...`
                            : avaliacao.comentario || 'Sem comentário'
                          }
                        </div>
                      </td>
                      <td className="status-cell">
                        <span className={`status-badge status-${avaliacao.status}`}>
                          {Status.obterNome(avaliacao.status)}
                        </span>
                      </td>
                      <td className="actions-cell">
                        <div className="action-buttons">
                          <Link 
                            to={Rotas.admin.avaliacoes.editar(avaliacao.id)} 
                            className="btn-editar"
                            title="Editar"
                          >
                            ✏️
                          </Link>
                          <button 
                            onClick={() => deletarAvaliacao(avaliacao.id)}
                            className="btn-deletar"
                            title="Deletar"
                          >
                            🗑️
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="7" className="no-data">
                      {consulta ? "Nenhuma avaliação encontrada" : "Nenhuma avaliação cadastrada"}
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}

        <div className="table-info">
          <p>Total: {avaliacoesFiltradas.length} avaliações</p>
        </div>
      </div>

      <Rodape />
    </div>
  );
};