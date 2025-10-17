import { useEffect, useState, useRef } from "react";
import Pais from "../components/item/Pais";
import Prato from "../components/item/Prato";
import Menu from "../components/layout/Menu";
import Rodape from "../components/layout/Rodape";
import "./Inicio.css";
import Requisicao from "../utils/requisicao/Requisicao";
import BackendEndPoints from "../constants/BackendEndPoints";

export default () => {
  const [experimente, setExperimente] = useState([]);
  const [favoritos, setFavoritos] = useState([]);
  const [procurados, setProcurados] = useState([]);
  const [loading, setLoading] = useState(true);
  const favoritosRef = useRef(null);
  const paisesRef = useRef(null);
  const experimenteRef = useRef(null);

  const shuffleArray = (array) => {
    const shuffled = [...array];
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    return shuffled;
  };

  const scroll = (ref, direction) => {
    if (ref.current) {
      const container = ref.current;
      const cardWidth = container.querySelector('.produto')?.offsetWidth || 280;
      const gap = 30;
      const containerWidth = container.offsetWidth;
      const centerOffset = (containerWidth - cardWidth) / 2;
      
      const currentScroll = container.scrollLeft;
      const cardIndex = Math.round((currentScroll + centerOffset) / (cardWidth + gap));
      const newIndex = direction === 'next' ? cardIndex + 1 : cardIndex - 1;
      const targetScroll = newIndex * (cardWidth + gap) - centerOffset;
      
      container.scrollTo({
        left: Math.max(0, targetScroll),
        behavior: 'smooth'
      });
    }
  };

  async function obterDados() {
    try {
      const [respostas, respostaFavoritos, respostaPaises] = await Promise.all([
        Requisicao.obter(BackendEndPoints.produtos.experimente),
        Requisicao.obter(BackendEndPoints.produtos.favoritos),
        Requisicao.obter(BackendEndPoints.paises.listar)
      ]);
      
      setExperimente(shuffleArray(respostas.dados));
      setFavoritos(respostaFavoritos.dados);
      setProcurados(shuffleArray(respostaPaises.dados));
    } catch (error) {
      console.error('Erro ao carregar dados:', error);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    obterDados();
  }, []);

  if (loading) {
    return (
      <div>
        <Menu />
        <div className="loading-container">
          <div className="loading-spinner"></div>
          <p>Carregando...</p>
        </div>
        <Rodape />
      </div>
    );
  }

  return (
    <div className="inicio-page">
      <Menu />
      
      <div className="design">
        <img className="desigo" src="desenho.png" />
      </div>

      <main className="main-content">
        <section className="section">
          <div className="section-header">
            <h2><i className="fa fa-star"></i> Favoritos dos Clientes</h2>
            <p>Os pratos mais amados pelos nossos clientes</p>
          </div>
          <div className="carousel-container">
            <button className="carousel-arrow prev" onClick={() => scroll(favoritosRef, 'prev')}>
              <i className="fa fa-chevron-left"></i>
            </button>
            <div className="items-grid" ref={favoritosRef}>
              {favoritos.map((favorito, index) => (
                <Prato key={favorito.id || index} {...favorito} />
              ))}
            </div>
            <button className="carousel-arrow next" onClick={() => scroll(favoritosRef, 'next')}>
              <i className="fa fa-chevron-right"></i>
            </button>
          </div>
        </section>

        <section className="section">
          <div className="section-header">
            <h2><i className="fa fa-globe"></i> Nossos Países</h2>
            <p>Explore as culinárias mais populares</p>
          </div>
          <div className="carousel-container">
            <button className="carousel-arrow prev" onClick={() => scroll(paisesRef, 'prev')}>
              <i className="fa fa-chevron-left"></i>
            </button>
            <div className="items-grid" ref={paisesRef}>
              {shuffleArray(procurados).slice(0, 3).map((procurado, index) => (
                <Pais key={procurado.id || index} {...procurado} />
              ))}
            </div>
            <button className="carousel-arrow next" onClick={() => scroll(paisesRef, 'next')}>
              <i className="fa fa-chevron-right"></i>
            </button>
          </div>
        </section>

        <section className="section">
          <div className="section-header">
            <h2><i className="fa fa-utensils"></i> Experimente Também</h2>
            <p>Novos sabores esperando por você</p>
          </div>
          <div className="carousel-container">
            <button className="carousel-arrow prev" onClick={() => scroll(experimenteRef, 'prev')}>
              <i className="fa fa-chevron-left"></i>
            </button>
            <div className="items-grid" ref={experimenteRef}>
              {experimente.map((produto, index) => (
                <Prato key={produto.id || index} {...produto} />
              ))}
            </div>
            <button className="carousel-arrow next" onClick={() => scroll(experimenteRef, 'next')}>
              <i className="fa fa-chevron-right"></i>
            </button>
          </div>
        </section>
      </main>
      
      <Rodape />
    </div>
  );
};
