import Menu from "../components/layout/Menu";
import Rodape from "../components/layout/Rodape";
import "./Local.css";

export default () => {
  return (
    <div className="local-page">
      <Menu />
      
      <div className="local-container">
        <div className="hero-section">
          <h1>Nossa Localização</h1>
          <p className="subtitle">Venha nos visitar e conhecer nosso espaço</p>
        </div>

        <div className="content-section">
          <div className="store-info">
            <div className="store-image">
              <img src="/loja.png" alt="Nossa Loja" />
            </div>
            
            <div className="address-card">
              <div className="address-info">
                <i className="fa fa-map-marker-alt"></i>
                <div>
                  <h3>Endereço</h3>
                  <p>Praça Senador José Roberto Leite Penteado, 490 - Lapa - SP <br /> CEP: 05078-020</p>
                  <button className="maps-button" onClick={() => window.open('https://www.google.com.br/maps/place/Pra%C3%A7a+Senador+Jos%C3%A9+Roberto+Leite+Penteado,+490+-+Lapa,+S%C3%A3o+Paulo+-+SP,+05078-020/@-23.5214584,-46.7234937,17z/data=!3m1!4b1!4m6!3m5!1s0x94cef892da08fbe5:0x8b9bdd3fe6a5db23!8m2!3d-23.5214584!4d-46.7209188!16s%2Fg%2F11c2f5cqwb?entry=ttu&g_ep=EgoyMDI1MTAxNC4wIKXMDSoASAFQAw%3D%3D', '_blank')}>🗺️ Ver no Mapa</button>
                </div>
              </div>
              
              <div className="contact-info">
                <div className="info-item">
                  <i className="fa fa-clock"></i>
                  <div>
                    <h4>Horário de Funcionamento</h4>
                  <p>Segunda a Sexta: 08h às 20h<br />Sábado: 08:00 às 18:00 <br /> Domingo: 08:00 às 14:00</p>
                  </div>
                </div>
                
                <div className="info-item">
                  <i className="fa fa-phone"></i>
                  <div>
                    <h4>Telefone</h4>
                    <p>(11) 99360-9399</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
      
      <Rodape />
    </div>
  );
};
