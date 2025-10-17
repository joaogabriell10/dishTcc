import { useEffect, useState } from "react";
import BackendEndPoints from "../../../constants/BackendEndPoints";
import Requisicao from "../../../utils/requisicao/Requisicao";
import Menu from "../../../components/layout/Menu";
import Status from "../../../constants/Status";
import Rodape from "../../../components/layout/Rodape";
import { Link, useNavigate } from "react-router-dom";
import Rotas from "../../../constants/Rotas";
import BackendUrl from "../../../constants/BackendUrl";
import imprimirPreco from "../../../utils/imprimirPreco";
import "./ProdutosAdminLista.css";

export default () => {
  const [produtos, setProdutos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [consulta, setConsulta] = useState("");
  const navigate = useNavigate();

  async function obterProdutos() {
    try {
      setLoading(true);
      const resposta = await Requisicao.obter(BackendEndPoints.produtos.listar);
      setProdutos(resposta.dados);
    } catch (error) {
      console.error("Erro ao carregar produtos:", error);
    } finally {
      setLoading(false);
    }
  }

  async function deletarProduto(id) {
    if (window.confirm("Tem certeza que deseja deletar este produto?")) {
      try {
        await Requisicao.obter(BackendEndPoints.produtos.deletar(id));
        obterProdutos();
      } catch (error) {
        alert("Erro ao deletar produto");
      }
    }
  }

  useEffect(() => {
    obterProdutos();
  }, []);

  const produtosFiltrados = produtos.filter((produto) =>
    produto.nome?.toLowerCase().includes(consulta.toLowerCase()) ||
    produto.pais?.nome?.toLowerCase().includes(consulta.toLowerCase()) ||
    produto.tipoPrato?.toLowerCase().includes(consulta.toLowerCase()) ||
    String(produto.id).includes(consulta) ||
    String(produto.preco).includes(consulta)
  );

  return (
    <div className="admin-page">
      <Menu />
      
      <div className="admin-container">
        <div className="admin-header">
          <h1>Gerenciar Produtos</h1>
          <p>Administre os produtos disponíveis no sistema</p>
        </div>

        <div className="admin-actions">
          <Link to={Rotas.admin.produtos.adicionar} className="btn-adicionar">
            + Adicionar Produto
          </Link>
          
          <div className="search-container">
            <input
              type="text"
              placeholder="Pesquisar por nome, país, tipo..."
              value={consulta}
              onChange={(e) => setConsulta(e.target.value)}
              className="search-input"
            />
          </div>
        </div>

        {loading ? (
          <div className="loading-container">
            <div className="loading-spinner"></div>
            <p>Carregando produtos...</p>
          </div>
        ) : (
          <div className="table-container">
            <table className="admin-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Produto</th>
                  <th>Imagem</th>
                  <th>Preço</th>
                  <th>País</th>
                  <th>Tipo</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                {produtosFiltrados.length > 0 ? (
                  produtosFiltrados.map((produto) => (
                    <tr key={produto.id}>
                      <td className="id-cell">{produto.id}</td>
                      <td className="produto-cell">
                        <div className="produto-info">
                          <span className="produto-nome">{produto.nome}</span>
                        </div>
                      </td>
                      <td className="imagem-cell">
                        <img 
                          src={BackendUrl + BackendEndPoints.produtos.imagem(produto.id)} 
                          alt={produto.nome}
                          className="produto-preview"
                        />
                      </td>
                      <td className="preco-cell">
                        <span className="preco-valor">{imprimirPreco(produto.preco)}</span>
                      </td>
                      <td className="pais-cell">
                        <div className="pais-info">
                          <i className={`fi fi-${produto.pais?.codigo} flag-icon`}></i>
                          <span>{produto.pais?.nome}</span>
                        </div>
                      </td>
                      <td className="tipo-cell">
                        <span className="tipo-badge">{produto.tipoPrato}</span>
                      </td>
                      <td className="status-cell">
                        <span className={`status-badge status-${produto.status}`}>
                          {Status.obterNome(produto.status)}
                        </span>
                      </td>
                      <td className="actions-cell">
                        <div className="action-buttons">
                          <Link 
                            to={Rotas.admin.produtos.editar(produto.id)} 
                            className="btn-editar"
                            title="Editar"
                          >
                            ✏️
                          </Link>
                          <button 
                            onClick={() => deletarProduto(produto.id)}
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
                      {consulta ? "Nenhum produto encontrado" : "Nenhum produto cadastrado"}
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}

        <div className="table-info">
          <p>Total: {produtosFiltrados.length} produtos</p>
        </div>
      </div>

      <Rodape />
    </div>
  );
};