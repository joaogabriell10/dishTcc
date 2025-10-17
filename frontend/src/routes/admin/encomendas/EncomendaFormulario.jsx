import { useEffect, useState } from "react";
import Requisicao from "../../../utils/requisicao/Requisicao";
import BackendEndPoints from "../../../constants/BackendEndPoints";
import Rotas from "../../../constants/Rotas";
import CampoEntrada from "../../../components/entradas/CampoEntrada";
import SelecaoEntrada from "../../../components/entradas/SelecaoEntrada";
import imprimirPreco from "../../../utils/imprimirPreco";
import Menu from "../../../components/layout/Menu";
import Rodape from "../../../components/layout/Rodape";
import "./EncomendaFormulario.css";

export default () => {
  const [usuarios, setUsuarios] = useState([]);
  const [produtos, setProdutos] = useState([]);
  const [itensEncomenda, setItensEncomenda] = useState([]);
  const [produtoSelecionado, setProdutoSelecionado] = useState(-1);
  const [quantidade, setQuantidade] = useState(1);

  async function obterUsuarios() {
    const resposta = await Requisicao.obter(BackendEndPoints.usuarios.listar);
    setUsuarios(resposta.dados);
  }

  async function obterProdutos() {
    const resposta = await Requisicao.obter(BackendEndPoints.produtos.listar);
    setProdutos(resposta.dados);
  }

  useEffect(() => {
    obterUsuarios();
    obterProdutos();
  }, []);

  const [usuarioId, setUsuarioId] = useState(-1);
  const [valorTotal, setValorTotal] = useState(0);
  const [dataEncomenda, setDataEncomenda] = useState("");

  const adicionarItem = () => {
    const produto = produtos.find(p => p.id === produtoSelecionado);
    if (produto && quantidade > 0) {
      const novoItem = {
        produtoId: produto.id,
        produto: produto,
        quantidade: quantidade,
        precoUnitario: produto.preco,
        subtotal: produto.preco * quantidade
      };
      const novosItens = [...itensEncomenda, novoItem];
      setItensEncomenda(novosItens);
      calcularTotal(novosItens);
      setProdutoSelecionado(-1);
      setQuantidade(1);
    }
  };

  const removerItem = (index) => {
    const novosItens = itensEncomenda.filter((_, i) => i !== index);
    setItensEncomenda(novosItens);
    calcularTotal(novosItens);
  };

  const calcularTotal = (itens) => {
    const total = itens.reduce((acc, item) => acc + item.subtotal, 0);
    setValorTotal(total);
  };

  const finalizarEncomenda = async () => {
    if (itensEncomenda.length === 0) {
      alert('Adicione pelo menos um item à encomenda');
      return;
    }
    
    if (usuarioId === -1) {
      alert('Selecione um usuário para a encomenda');
      return;
    }
    
    if (!dataEncomenda) {
      alert('Existem campos não preenchidos. Preencha a data da encomenda.');
      return;
    }
    
    try {
      // Criar uma encomenda para cada item
      for (const item of itensEncomenda) {
        const dadosEncomenda = {
          usuarioId: usuarioId,
          produtoId: item.produtoId,
          dataEncomenda: dataEncomenda || new Date().toISOString(),
          valorTotal: item.subtotal,
          quantidade: item.quantidade,
          preco: item.precoUnitario,
          status: 1
        };
        
        console.log('Enviando dados do item:', dadosEncomenda);
        const resposta = await Requisicao.enviar(BackendEndPoints.encomendas.salvar, dadosEncomenda);
        console.log('Resposta do item:', resposta);
      }
      
      alert('Encomenda criada com sucesso!');
      window.location.href = Rotas.admin.encomendas.lista;
    } catch (error) {
      console.error('Erro completo:', error);
      alert('Erro ao criar encomenda: ' + (error.message || 'Erro desconhecido'));
    }
  };

  return (
    <div className="admin-page">
      <Menu />
      
      <div className="admin-container">
        <div className="admin-header">
          <h1>Nova Encomenda</h1>
          <p>Criar uma nova encomenda no sistema</p>
        </div>

        <div className="form-container">
          <SelecaoEntrada
            controller={{ value: usuarioId, onChange: (e) => setUsuarioId(parseInt(e.target.value) || -1) }}
            id="usuario"
            label="Usuário"
            padrao={-1}
            opcoes={usuarios.map((usuario) => ({
              texto: `${usuario.nome} (${usuario.email})`,
              valor: usuario.id,
            }))}
          />
          
          <div className="itens-section">
            <h3>Itens da Encomenda</h3>
            
            <div className="adicionar-item">
              <SelecaoEntrada
                controller={{ value: produtoSelecionado, onChange: (e) => setProdutoSelecionado(parseInt(e.target.value) || -1) }}
                id="produto"
                label="Produto"
                padrao={-1}
                opcoes={produtos.map((produto) => ({
                  texto: `${produto.nome} - ${imprimirPreco(produto.preco)}`,
                  valor: produto.id,
                }))}
              />
              <CampoEntrada
                id="quantidade"
                tipo="number"
                controller={{ value: quantidade, onChange: (e) => setQuantidade(parseInt(e.target.value) || 1) }}
                label="Quantidade"
              />
              <button type="button" onClick={adicionarItem} className="btn-adicionar-item">
                Adicionar Item
              </button>
            </div>

            {itensEncomenda.length > 0 && (
              <div className="lista-itens">
                <table className="tabela-itens">
                  <thead>
                    <tr>
                      <th>Produto</th>
                      <th>Quantidade</th>
                      <th>Preço Unit.</th>
                      <th>Subtotal</th>
                      <th>Ações</th>
                    </tr>
                  </thead>
                  <tbody>
                    {itensEncomenda.map((item, index) => (
                      <tr key={index}>
                        <td>{item.produto.nome}</td>
                        <td>{item.quantidade}</td>
                        <td>{imprimirPreco(item.precoUnitario)}</td>
                        <td>{imprimirPreco(item.subtotal)}</td>
                        <td>
                          <button 
                            type="button" 
                            onClick={() => removerItem(index)}
                            className="btn-remover"
                          >
                            🗑️
                          </button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>

          <CampoEntrada
            id="valorTotal"
            tipo="number"
            controller={{ value: valorTotal, onChange: (e) => setValorTotal(parseFloat(e.target.value) || 0) }}
            label="Valor Total"
            readonly
          />
          
          <CampoEntrada
            id="dataEncomenda"
            tipo="datetime-local"
            controller={{ value: dataEncomenda, onChange: (e) => setDataEncomenda(e.target.value) }}
            label="Data da Encomenda"
          />

          <div className="finalizar-section">
            <button 
              type="button" 
              onClick={finalizarEncomenda}
              className="btn-finalizar"
              disabled={itensEncomenda.length === 0}
            >
              Finalizar Encomenda
            </button>
          </div>
        </div>
      </div>
      
      <Rodape />
    </div>
  );
};