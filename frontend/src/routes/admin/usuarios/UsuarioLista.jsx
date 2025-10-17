import { useEffect, useState } from "react";
import BackendEndPoints from "../../../constants/BackendEndPoints";
import Requisicao from "../../../utils/requisicao/Requisicao";
import Menu from "../../../components/layout/Menu";
import Status from "../../../constants/Status";
import Rodape from "../../../components/layout/Rodape";
import { Link, useNavigate } from "react-router-dom";
import Rotas from "../../../constants/Rotas";
import "./UsuarioLista.css";

export default () => {
  const [usuarios, setUsuarios] = useState([]);
  const [loading, setLoading] = useState(true);
  const [consulta, setConsulta] = useState("");
  const navigate = useNavigate();

  async function obterUsuarios() {
    try {
      setLoading(true);
      const resposta = await Requisicao.obter(BackendEndPoints.usuarios.listar);
      setUsuarios(resposta.dados);
    } catch (error) {
      console.error("Erro ao carregar usuários:", error);
    } finally {
      setLoading(false);
    }
  }

  async function deletarUsuario(id) {
    if (window.confirm("Tem certeza que deseja deletar este usuário?")) {
      try {
        await Requisicao.obter(BackendEndPoints.usuarios.deletar(id));
        obterUsuarios();
      } catch (error) {
        alert("Erro ao deletar usuário");
      }
    }
  }

  useEffect(() => {
    obterUsuarios();
  }, []);

  const usuariosFiltrados = usuarios.filter((usuario) =>
    usuario.nome?.toLowerCase().includes(consulta.toLowerCase()) ||
    usuario.email?.toLowerCase().includes(consulta.toLowerCase()) ||
    usuario.cpf?.includes(consulta) ||
    usuario.telefone?.includes(consulta) ||
    String(usuario.id).includes(consulta) ||
    usuario.nivelAcesso?.toLowerCase().includes(consulta.toLowerCase())
  );

  const getNivelAcessoBadge = (nivel) => {
    const niveis = {
      'ADMIN': { class: 'nivel-admin', text: 'Administrador' },
      'USER': { class: 'nivel-user', text: 'Usuário' },
      'MODERATOR': { class: 'nivel-moderator', text: 'Moderador' }
    };
    return niveis[nivel] || { class: 'nivel-user', text: nivel };
  };

  return (
    <div className="admin-page">
      <Menu />
      
      <div className="admin-container">
        <div className="admin-header">
          <h1>Gerenciar Usuários</h1>
          <p>Administre os usuários do sistema</p>
        </div>

        <div className="admin-actions">
          <Link to={Rotas.admin.usuarios.adicionar} className="btn-adicionar">
            + Adicionar Usuário
          </Link>
          
          <div className="search-container">
            <input
              type="text"
              placeholder="Pesquisar por nome, email, CPF..."
              value={consulta}
              onChange={(e) => setConsulta(e.target.value)}
              className="search-input"
            />
          </div>
        </div>

        {loading ? (
          <div className="loading-container">
            <div className="loading-spinner"></div>
            <p>Carregando usuários...</p>
          </div>
        ) : (
          <div className="table-container">
            <table className="admin-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Nome</th>
                  <th>Email</th>
                  <th>CPF</th>
                  <th>Telefone</th>
                  <th>Nível</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                {usuariosFiltrados.length > 0 ? (
                  usuariosFiltrados.map((usuario) => (
                    <tr key={usuario.id}>
                      <td className="id-cell">{usuario.id}</td>
                      <td className="nome-cell">
                        <div className="usuario-info">
                          <span className="usuario-nome">{usuario.nome}</span>
                        </div>
                      </td>
                      <td className="email-cell">{usuario.email}</td>
                      <td className="cpf-cell">
                        <span className="cpf-formatado">
                          {usuario.cpf?.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4') || 'N/A'}
                        </span>
                      </td>
                      <td className="telefone-cell">
                        <span className="telefone-formatado">
                          {usuario.telefone?.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3') || 'N/A'}
                        </span>
                      </td>
                      <td className="nivel-cell">
                        <span className={`nivel-badge ${getNivelAcessoBadge(usuario.nivelAcesso).class}`}>
                          {getNivelAcessoBadge(usuario.nivelAcesso).text}
                        </span>
                      </td>
                      <td className="status-cell">
                        <span className={`status-badge status-${usuario.status}`}>
                          {Status.obterNome(usuario.status)}
                        </span>
                      </td>
                      <td className="actions-cell">
                        <div className="action-buttons">
                          <Link 
                            to={Rotas.admin.usuarios.editar(usuario.id)} 
                            className="btn-editar"
                            title="Editar"
                          >
                            ✏️
                          </Link>
                          <button 
                            onClick={() => deletarUsuario(usuario.id)}
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
                    <td colSpan="8" className="no-data">
                      {consulta ? "Nenhum usuário encontrado" : "Nenhum usuário cadastrado"}
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}

        <div className="table-info">
          <p>Total: {usuariosFiltrados.length} usuários</p>
        </div>
      </div>

      <Rodape />
    </div>
  );
};