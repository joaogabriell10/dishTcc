import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import Requisicao from "../../../utils/requisicao/Requisicao";
import BackendEndPoints from "../../../constants/BackendEndPoints";
import Rotas from "../../../constants/Rotas";
import Menu from "../../../components/layout/Menu";
import Rodape from "../../../components/layout/Rodape";
import "../../../components/FormularioAdmin.css";

export default () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [encomendas, setEncomendas] = useState([]);
  const [loading, setLoading] = useState(true);

  async function obterEncomendas() {
    try {
      const resposta = await Requisicao.obter(BackendEndPoints.encomendas.listar);
      const encomendaBase = resposta.dados.find(e => e.id == id);
      if (encomendaBase) {
        const encomendasGrupo = resposta.dados.filter(e => 
          e.usuarioId === encomendaBase.usuarioId && 
          e.dataEncomenda === encomendaBase.dataEncomenda
        );
        setEncomendas(encomendasGrupo);
      }
    } catch (error) {
      console.error("Erro ao carregar encomendas:", error);
    } finally {
      setLoading(false);
    }
  }

  async function salvarEncomendas() {
    try {
      for (const encomenda of encomendas) {
        await Requisicao.enviar(BackendEndPoints.encomendas.atualizar, encomenda);
      }
      alert("Encomendas atualizadas com sucesso!");
      navigate(Rotas.admin.encomendas.lista);
    } catch (error) {
      alert("Erro ao atualizar encomendas");
    }
  }

  async function finalizarEncomenda() {
    if (window.confirm("Confirma a retirada desta encomenda?")) {
      try {
        const encomendasFinalizadas = encomendas.map(enc => ({...enc, retirada: true}));
        for (const encomenda of encomendasFinalizadas) {
          await Requisicao.enviar(BackendEndPoints.encomendas.atualizar, encomenda);
        }
        alert("Encomenda finalizada com sucesso!");
        navigate(Rotas.admin.encomendas.lista);
      } catch (error) {
        alert("Erro ao finalizar encomenda");
      }
    }
  }

  const atualizarEncomenda = (index, campo, valor) => {
    const novasEncomendas = [...encomendas];
    if (campo === 'quantidade') {
      // Manter o preço unitário e recalcular o preço total
      const precoUnitario = novasEncomendas[index].preco;
      novasEncomendas[index].quantidade = valor;
      novasEncomendas[index].preco = precoUnitario;
    } else {
      novasEncomendas[index][campo] = valor;
    }
    setEncomendas(novasEncomendas);
  };

  useEffect(() => {
    obterEncomendas();
  }, [id]);

  if (loading) return (
    <div className="formulario-admin-page">
      <Menu />
      <div className="formulario-container">
        <div className="loading-container">
          <div className="loading-spinner"></div>
          <p>Carregando encomenda...</p>
        </div>
      </div>
      <Rodape />
    </div>
  );
  if (encomendas.length === 0) return <div>Encomenda não encontrada</div>;

  return (
    <div className="formulario-admin-page">
      <Menu />
      
      <div className="formulario-container">
        <div className="formulario-card">
          <div className="formulario-header">
            <h1 className="formulario-titulo">
              Editar Encomenda
            </h1>
            <p className="formulario-subtitulo">
              Usuário: {encomendas[0]?.usuario?.nome} ({encomendas[0]?.usuario?.email})
            </p>
          </div>
          
          <div className="formulario-form">
            <div className="info-encomenda">
              <div className="campo-info">
                <label>Usuário:</label>
                <span>{encomendas[0]?.usuario?.nome}</span>
              </div>
              <div className="campo-info">
                <label>Email:</label>
                <span>{encomendas[0]?.usuario?.email}</span>
              </div>
              <div className="campo-info">
                <label>Data:</label>
                {encomendas[0]?.retirada ? (
                  <span>{new Date(encomendas[0]?.dataEncomenda).toLocaleDateString('pt-BR', {
                    day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit'
                  })}</span>
                ) : (
                  <input 
                    type="datetime-local" 
                    value={encomendas[0]?.dataEncomenda?.slice(0, 16)}
                    onChange={(e) => {
                      const novasEncomendas = encomendas.map(enc => ({...enc, dataEncomenda: e.target.value}));
                      setEncomendas(novasEncomendas);
                    }}
                    style={{padding: '5px'}}
                  />
                )}
              </div>
              <div className="campo-info">
                <label>Valor Total:</label>
                <span>R$ {encomendas.reduce((total, enc) => total + ((enc.preco * enc.quantidade) || 0), 0).toFixed(2)}</span>
              </div>
              <div className="campo-info">
                <label>Status:</label>
                {encomendas[0]?.retirada ? (
                  <span>{encomendas[0]?.status === 1 ? 'ATIVO' : 'INATIVO'}</span>
                ) : (
                  <select 
                    value={encomendas[0]?.status || 1}
                    onChange={(e) => {
                      const novasEncomendas = encomendas.map(enc => ({...enc, status: parseInt(e.target.value)}));
                      setEncomendas(novasEncomendas);
                    }}
                    style={{padding: '5px'}}
                  >
                    <option value={1}>ATIVO</option>
                    <option value={0}>INATIVO</option>
                  </select>
                )}
              </div>

            </div>
            
            <h3>Produtos da Encomenda</h3>
            <table className="admin-table">
              <thead>
                <tr>
                  <th>Produto</th>
                  <th>Quantidade</th>
  <th>Preço Unit.</th>
                </tr>
              </thead>
              <tbody>
                {encomendas.map((encomenda, index) => (
                  <tr key={encomenda.id}>
                    <td>{encomenda.produto?.nome}</td>
                    <td>
                      {encomenda.retirada ? (
                        <span>{encomenda.quantidade}</span>
                      ) : (
                        <input 
                          type="number" 
                          value={encomenda.quantidade}
                          onChange={(e) => atualizarEncomenda(index, 'quantidade', parseInt(e.target.value))}
                          style={{width: '80px', padding: '5px'}}
                        />
                      )}
                    </td>
                    <td>
                      <input 
                        type="number" 
                        step="0.01"
                        value={encomenda.preco}
                        readOnly
                        style={{width: '100px', padding: '5px', backgroundColor: '#f8f9fa'}}
                      />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
            
            <div className="formulario-acoes">
              <button type="button" className="btn-cancelar" onClick={() => navigate(-1)}>
                Voltar
              </button>
              {!encomendas.every(enc => enc.retirada) && (
                <button type="button" className="btn-salvar" onClick={salvarEncomendas}>
                  Atualizar
                </button>
              )}
              <button 
                type="button" 
                className="btn-finalizar" 
                onClick={finalizarEncomenda}
                disabled={encomendas.every(enc => enc.retirada)}
              >
                {encomendas.every(enc => enc.retirada) ? 'Já Retirada' : 'Finalizar Retirada'}
              </button>
            </div>
          </div>
        </div>
      </div>
      
      <Rodape />
    </div>
  );
};