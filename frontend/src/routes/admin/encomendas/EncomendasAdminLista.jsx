import { useEffect, useState } from "react";
import BackendEndPoints from "../../../constants/BackendEndPoints";
import Requisicao from "../../../utils/requisicao/Requisicao";
import Menu from "../../../components/layout/Menu";
import Status from "../../../constants/Status";
import Rodape from "../../../components/layout/Rodape";
import { Link } from "react-router-dom";
import Rotas from "../../../constants/Rotas";
import imprimirPreco from "../../../utils/imprimirPreco";
import "./EncomendasAdminLista.css";

export default () => {
  const [encomendas, setEncomendas] = useState([]);
  const [loading, setLoading] = useState(true);
  const [consulta, setConsulta] = useState("");

  async function obterEncomendas() {
    try {
      setLoading(true);
      const resposta = await Requisicao.obter(BackendEndPoints.encomendas.listar);
      setEncomendas(resposta.dados);
    } catch (error) {
      console.error("Erro ao carregar encomendas:", error);
    } finally {
      setLoading(false);
    }
  }

  async function deletarEncomenda(encomenda) {
    if (window.confirm("Tem certeza que deseja deletar esta encomenda?")) {
      try {
        for (const item of encomenda.itens) {
          await Requisicao.obter(BackendEndPoints.encomendas.deletar(item.id));
        }
        obterEncomendas();
      } catch (error) {
        alert("Erro ao deletar encomenda");
      }
    }
  }

  useEffect(() => {
    obterEncomendas();
  }, []);

  // Agrupar encomendas por usuário e data/hora
  const encomendasAgrupadas = encomendas.reduce((acc, encomenda) => {
    const chave = `${encomenda.usuarioId}_${encomenda.dataEncomenda}`;
    if (!acc[chave]) {
      acc[chave] = {
        id: encomenda.id,
        usuario: encomenda.usuario,
        dataEncomenda: encomenda.dataEncomenda,
        status: encomenda.status,
        retirada: encomenda.retirada,
        itens: [],
        valorTotal: 0
      };
    }
    acc[chave].itens.push({
      id: encomenda.id,
      produto: encomenda.produto,
      quantidade: encomenda.quantidade,
      preco: encomenda.preco,
      retirada: encomenda.retirada
    });
    acc[chave].valorTotal += (encomenda.preco * encomenda.quantidade) || 0;
    // Atualizar retirada se todos os itens foram retirados
    acc[chave].retirada = acc[chave].itens.every(item => item.retirada);
    return acc;
  }, {});

  const encomendasLista = Object.values(encomendasAgrupadas);

  const encomendasFiltradas = encomendasLista.filter((encomenda) => {
    const pratosTexto = encomenda.itens.map(item => item.produto?.nome).join(' ');
    return String(encomenda.id).includes(consulta) ||
      encomenda.usuario?.nome?.toLowerCase().includes(consulta.toLowerCase()) ||
      encomenda.usuario?.email?.toLowerCase().includes(consulta.toLowerCase()) ||
      pratosTexto.toLowerCase().includes(consulta.toLowerCase()) ||
      String(encomenda.valorTotal).includes(consulta);
  });

  const formatarData = (data) => {
    return new Date(data).toLocaleDateString('pt-BR', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  return (
    <div className="admin-page">
      <Menu />
      
      <div className="admin-container">
        <div className="admin-header">
          <h1>Gerenciar Encomendas</h1>
          <p>Administre as encomendas realizadas no sistema</p>
        </div>

        <div className="admin-actions">
          <Link to={Rotas.admin.encomendas.adicionar} className="btn-adicionar">
            + Adicionar Encomenda
          </Link>
          
          <div className="search-container">
            <input
              type="text"
              placeholder="Pesquisar por ID, usuário, email, pratos..."
              value={consulta}
              onChange={(e) => setConsulta(e.target.value)}
              className="search-input"
            />
          </div>
        </div>

        {loading ? (
          <div className="loading-container">
            <div className="loading-spinner"></div>
            <p>Carregando encomendas...</p>
          </div>
        ) : (
          <div className="table-container">
            <table className="admin-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Usuário</th>
                  <th>Email</th>
                  <th>Pratos</th>
                  <th>Data</th>
                  <th>Valor Total</th>
                  <th>Status</th>
                  <th>Retirada</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                {encomendasFiltradas.length > 0 ? (
                  encomendasFiltradas.map((encomenda) => (
                    <tr key={encomenda.id}>
                      <td className="id-cell">{encomenda.id}</td>
                      <td className="usuario-cell">
                        <div className="usuario-info">
                          <span className="usuario-nome">{encomenda.usuario?.nome}</span>
                        </div>
                      </td>
                      <td className="email-cell">
                        <span className="email-valor">{encomenda.usuario?.email}</span>
                      </td>
                      <td className="pratos-cell">
                        <div className="pratos-valor">
                          {encomenda.itens.map((item, index) => (
                            <div key={index} className="prato-item">
                              <span className="prato-nome">{item.produto?.nome}</span>
                              <span className="prato-quantidade">({item.quantidade}x)</span>
                            </div>
                          ))}
                        </div>
                      </td>
                      <td className="data-cell">
                        <span className="data-valor">{formatarData(encomenda.dataEncomenda)}</span>
                      </td>
                      <td className="valor-cell">
                        <span className="valor-total">{imprimirPreco(encomenda.valorTotal)}</span>
                      </td>
                      <td className="status-cell">
                        <span className={`status-badge status-${encomenda.status}`}>
                          {Status.obterNome(encomenda.status)}
                        </span>
                      </td>
                      <td className="retirada-cell">
                        <span className={`retirada-badge ${encomenda.retirada ? 'retirada-sim' : 'retirada-nao'}`}>
                          {encomenda.retirada ? 'Sim' : 'Não'}
                        </span>
                      </td>
                      <td className="actions-cell">
                        <div className="action-buttons">
                          <Link 
                            to={Rotas.admin.encomendas.editar(encomenda.id)} 
                            className="btn-editar"
                            title="Editar"
                          >
                            ✏️
                          </Link>
                          <button 
                            onClick={() => deletarEncomenda(encomenda)}
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
                    <td colSpan="9" className="no-data">
                      {consulta ? "Nenhuma encomenda encontrada" : "Nenhuma encomenda cadastrada"}
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}

        <div className="table-info">
          <p>Total: {encomendasFiltradas.length} encomendas</p>
        </div>
      </div>

      <Rodape />
    </div>
  );
};