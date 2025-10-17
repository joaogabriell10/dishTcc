import Menu from "../components/layout/Menu";
import Rodape from "../components/layout/Rodape";
import "./Sobre.css";

export default () => {
  return (
    <div className="sobre-page">
      <Menu />
      
      <div className="sobre-container">
        <div className="hero-section">
          <h1>Sobre Nós</h1>
          <p className="subtitle">Conectando você aos sabores do mundo</p>
        </div>

        <div className="content-section">
          <div className="image-container">
            <img src="marmita.png" alt="Dish of the World" />
          </div>
          
          <div className="text-content">
            <div className="story-card">
              <h3>Nossa História</h3>
              <p>
                Nossa equipe tomou a iniciativa e transformou essa incrível ideia em
                realidade pois enxergávamos problemas em comidas congeladas que
                encontramos em distintos lugares à venda, como comidas sem cor, com
                sabor industrializado e sem criatividade.
              </p>
            </div>
            
            <div className="mission-card">
              <h3>Nossa Missão</h3>
              <p>
                Criamos a Dish of the World para oferecer aos nossos clientes
                experiências únicas e práticas em nossos pratos, comidas típicas e
                com muita personalidade de diversas partes do mundo, tudo isso sem
                sair do conforto da sua casa.
              </p>
            </div>
            
            <div className="vision-card">
              <h3>Nossa Visão</h3>
              <p>
                Nosso intuito é não só resolver o problema citado mas também trazer
                algo novo e fora da rotina para os nossos estimados clientes.
              </p>
            </div>
            
            <div className="values-card">
              <h3>Nossos Valores</h3>
              <p>
                Qualidade, autenticidade e inovação são os pilares que guiam
                nossa empresa. Valorizamos a diversidade cultural e buscamos
                sempre a excelência em cada prato que preparamos.
              </p>
            </div>
          </div>
        </div>
      </div>
      
      <Rodape />
    </div>
  );
};
