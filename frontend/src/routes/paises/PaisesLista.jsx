import { useEffect, useState } from "react";
import BackendEndPoints from "../../constants/BackendEndPoints";
import Pais from "../../components/item/Pais";
import Menu from "../../components/layout/Menu";
import Rodape from "../../components/layout/Rodape";
import Requisicao from "../../utils/requisicao/Requisicao";
import "./PaisesLista.css";

export default () => {
  const [paises, setPaises] = useState([]);
  const [loading, setLoading] = useState(true);

  async function obterPaises() {
    try {
      const resposta = await Requisicao.obter(
        BackendEndPoints.paises.listarParaCliente
      );
      setPaises(resposta.dados);
    } catch (error) {
      console.error('Erro ao carregar países:', error);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    obterPaises();
  }, []);

  if (loading) {
    return (
      <div className="paises-page">
        <Menu />
        <div className="loading-container">
          <div className="loading-spinner"></div>
          <p>Carregando países...</p>
        </div>
        <Rodape />
      </div>
    );
  }

  return (
    <div className="paises-page">
      <Menu />
      
      <div className="paises-container">
        <div className="paises-header">
          <h1>Explore Países</h1>
          <p>Descubra as deliciosas culinárias de diferentes países ao redor do mundo</p>
        </div>
        
        <div className="paises-grid">
          {paises.map((pais) => (
            <Pais key={pais.id} {...pais} />
          ))}
        </div>
      </div>
      
      <Rodape />
    </div>
  );
};
