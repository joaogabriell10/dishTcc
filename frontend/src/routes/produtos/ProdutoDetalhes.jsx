import { useEffect, useState } from "react";
import Menu from "../../components/layout/Menu";
import Rodape from "../../components/layout/Rodape";
import BackendEndPoints from "../../constants/BackendEndPoints";
import imprimirPreco from "../../utils/imprimirPreco";
import Requisicao from "../../utils/requisicao/Requisicao";
import { useParams, useNavigate } from "react-router-dom";
import BackendUrl from "../../constants/BackendUrl";
import "./ProdutoDetalhes.css";

export default () => {
  const { nome } = useParams();
  const navigate = useNavigate();
  const [produto, setProduto] = useState({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  
  async function obterProduto() {
    try {
      setLoading(true);
      setError(null);
      const resposta = await Requisicao.obter(
        BackendEndPoints.produtos.obterPorNome(nome.replaceAll("+", " "))
      );
      setProduto(resposta.dados);
    } catch (err) {
      setError("Erro ao carregar produto. Tente novamente.");
    } finally {
      setLoading(false);
    }
  }
  
  useEffect(() => {
    obterProduto();
  }, [nome]);
  
  const avaliacao = produto.avaliacoes?.length > 0 
    ? produto.avaliacoes.reduce((acc, curr) => acc + curr.nota, 0) / produto.avaliacoes.length
    : 0;



  if (loading) {
    return (
      <div className="produto-detalhes-page">
        <Menu />
        <div className="loading-container">
          <div className="loading-spinner"></div>
          <p>Carregando produto...</p>
        </div>
        <Rodape />
      </div>
    );
  }

  if (error) {
    return (
      <div className="produto-detalhes-page">
        <Menu />
        <div className="error-container">
          <h2>Ops! Algo deu errado</h2>
          <p>{error}</p>
          <button onClick={() => navigate(-1)} className="btn-voltar">
            ← Voltar
          </button>
        </div>
        <Rodape />
      </div>
    );
  }

  return (
    <div className="produto-detalhes-page">
      <Menu />
      
      <div className="produto-container">
        <div className="produto-header">
          <div className="produto-imagem">
            <img
              src={BackendUrl + BackendEndPoints.produtos.imagem(produto.id)}
              alt={produto.nome}
            />
          </div>
          
          <div className="produto-info">
            <div className="titulo-container">
              <h1>{produto.nome}</h1>
              <div className="pais-badge">
                <i className={`fi fi-${produto.pais?.codigo}`}></i>
                <span>{produto.pais?.nome}</span>
              </div>
            </div>
            
            <div className="avaliacao-container">
              <div className="estrelas">
                {[...Array(5)].map((_, i) => (
                  <span key={i} className={i < Math.round(avaliacao) ? "estrela-ativa" : "estrela-inativa"}>
                    ★
                  </span>
                ))}
              </div>
              <span className="avaliacao-texto">
                {avaliacao.toFixed(1)} ({produto.avaliacoes?.length || 0} avaliações)
              </span>
            </div>
            
            <div className="tipo-prato">
              <span className="label">Tipo:</span>
              <span className="valor">{produto.tipoPrato}</span>
            </div>
            

            <div className="produto-descricao">
              <h3>Sobre este prato</h3>
              <div className="descricao-texto">
                {produto?.descricao?.split("\n").map((paragrafo, index) => (
                  <p key={index}>{paragrafo}</p>
                ))}
              </div>
            </div>
            
            <div className="preco-container">
              <span className="preco">{imprimirPreco(produto.preco)}</span>
              <button className="btn-comprar">
                📱 Ir Para o Aplicativo
              </button>
            </div>
          </div>
        </div>
        
        {produto.avaliacoes?.length > 0 && (
          <div className="avaliacoes-section">
            <h3>Avaliações dos clientes</h3>
            <div className="avaliacoes-lista">
              {produto.avaliacoes.slice(0, 3).map((avaliacao, index) => (
                <div key={index} className="avaliacao-item">
                  <div className="avaliacao-header">
                    <div className="estrelas-pequenas">
                      {[...Array(5)].map((_, i) => (
                        <span key={i} className={i < avaliacao.nota ? "estrela-ativa" : "estrela-inativa"}>
                          ★
                        </span>
                      ))}
                    </div>
                    <span className="avaliacao-autor">
                      {avaliacao.usuario?.nome || 'Usuário'}
                    </span>
                  </div>
                  <p className="avaliacao-comentario">{avaliacao.comentario}</p>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
      
      <Rodape />
    </div>
  );
};
