import { useEffect, useState } from "react";
import BackendEndPoints from "../../../constants/BackendEndPoints";
import Requisicao from "../../../utils/requisicao/Requisicao";
import Menu from "../../../components/layout/Menu";
import Status from "../../../constants/Status";
import Rodape from "../../../components/layout/Rodape";
import { Link, useNavigate } from "react-router-dom";
import Rotas from "../../../constants/Rotas";
import BackendUrl from "../../../constants/BackendUrl";
import "./PaisesAdminLista.css";

export default () => {
  const [paises, setPaises] = useState([]);
  const [loading, setLoading] = useState(true);
  const [consulta, setConsulta] = useState("");
  const navigate = useNavigate();

  async function obterPaises() {
    try {
      setLoading(true);
      const resposta = await Requisicao.obter(BackendEndPoints.paises.listar);
      setPaises(resposta.dados);
    } catch (error) {
      console.error("Erro ao carregar países:", error);
    } finally {
      setLoading(false);
    }
  }

  async function deletarPais(id) {
    if (window.confirm("Tem certeza que deseja deletar este país?")) {
      try {
        await Requisicao.obter(BackendEndPoints.paises.deletar(id));
        obterPaises();
      } catch (error) {
        alert("Erro ao deletar país");
      }
    }
  }

  useEffect(() => {
    obterPaises();
  }, []);

  const paisesFiltrados = paises.filter((pais) =>
    pais.nome.toLowerCase().includes(consulta.toLowerCase()) ||
    String(pais.id).includes(consulta) ||
    pais.codigo.toLowerCase().includes(consulta.toLowerCase())
  );

  return (
    <div className="admin-page">
      <Menu />
      
      <div className="admin-container">
        <div className="admin-header">
          <h1>Gerenciar Países</h1>
          <p>Administre os países disponíveis no sistema</p>
        </div>

        <div className="admin-actions">
          <Link to={Rotas.admin.paises.adicionar} className="btn-adicionar">
            + Adicionar País
          </Link>
          
          <div className="search-container">
            <input
              type="text"
              placeholder="Pesquisar por nome, código ou ID..."
              value={consulta}
              onChange={(e) => setConsulta(e.target.value)}
              className="search-input"
            />
          </div>
        </div>

        {loading ? (
          <div className="loading-container">
            <div className="loading-spinner"></div>
            <p>Carregando países...</p>
          </div>
        ) : (
          <div className="table-container">
            <table className="admin-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>País</th>
                  <th>Código</th>
                  <th>Capa</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                {paisesFiltrados.length > 0 ? (
                  paisesFiltrados.map((pais) => (
                    <tr key={pais.id}>
                      <td className="id-cell">{pais.id}</td>
                      <td className="pais-cell">
                        <div className="pais-info">
                          <i className={`fi fi-${pais.codigo} flag-icon`}></i>
                          <span className="pais-nome">{pais.nome}</span>
                        </div>
                      </td>
                      <td className="codigo-cell">{pais.codigo}</td>
                      <td className="capa-cell">
                        <img 
                          src={BackendUrl + BackendEndPoints.paises.capa(pais.id)} 
                          alt={pais.nome}
                          className="capa-preview"
                        />
                      </td>
                      <td className="status-cell">
                        <span className={`status-badge status-${pais.status}`}>
                          {Status.obterNome(pais.status)}
                        </span>
                      </td>
                      <td className="actions-cell">
                        <div className="action-buttons">
                          <Link 
                            to={Rotas.admin.paises.editar(pais.id)} 
                            className="btn-editar"
                            title="Editar"
                          >
                            ✏️
                          </Link>
                          <button 
                            onClick={() => deletarPais(pais.id)}
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
                    <td colSpan="6" className="no-data">
                      {consulta ? "Nenhum país encontrado" : "Nenhum país cadastrado"}
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}

        <div className="table-info">
          <p>Total: {paisesFiltrados.length} países</p>
        </div>
      </div>

      <Rodape />
    </div>
  );
};