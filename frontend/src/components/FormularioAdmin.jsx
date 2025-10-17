import { useNavigate, useParams } from "react-router-dom";
import Requisicao from "../utils/requisicao/Requisicao";
import Menu from "./layout/Menu";
import Rodape from "./layout/Rodape";
import { useEffect, useState } from "react";
import "./FormularioAdmin.css";
import { Helmet } from "react-helmet";
import SelecaoEntrada from "./entradas/SelecaoEntrada";

export default ({
  valores,
  ceder,
  rota,
  endpoint,
  campos,
  titulo,
  controllerStatus,
}) => {
  const [mensagem, setMensagem] = useState("");
  const { id } = useParams();
  async function obterValores() {
    const resposta = await Requisicao.obter(endpoint.obter(id));
    console.log(resposta.dados);
    ceder(resposta.dados);
  }

  useEffect(() => {
    if (id) obterValores();
  }, [id]);

  const navigate = useNavigate();

  return (
    <div className="formulario-admin-page">
      <Menu />
      <Helmet>
        <title>{titulo} - Formulário</title>
      </Helmet>
      
      <div className="formulario-container">
        <div className="formulario-card">
          <div className="formulario-header">
            <h1 className="formulario-titulo">
              <i className="fa fa-edit"></i>
              {titulo}
            </h1>
            <p className="formulario-subtitulo">
              Preencha os campos abaixo para {id ? 'editar' : 'adicionar'} o registro
            </p>
          </div>
          
          <form
            className="formulario-form"
            onSubmit={async (e) => {
              e.preventDefault();
              try {
                const resposta = await Requisicao.enviar(
                  endpoint.salvar,
                  valores
                );
                setMensagem("");
                navigate(rota.lista);
              } catch (e) {
                setMensagem("Formulário inválido. Verifique os campos.");
              }
            }}
          >
            <div className="formulario-campos">
              {campos}
              
              <SelecaoEntrada
                padrao={-1}
                controller={controllerStatus}
                label="Status"
                id="status"
                opcoes={[
                  {
                    texto: "ATIVO",
                    valor: 1,
                  },
                  {
                    texto: "INATIVO",
                    valor: 0,
                  },
                ]}
              />
            </div>
            
            {mensagem && (
              <div className="form-erro">
                <i className="fa fa-exclamation-triangle"></i>
                {mensagem}
              </div>
            )}
            
            <div className="formulario-acoes">
              <button type="button" className="btn-cancelar" onClick={() => navigate(-1)}>
                <i className="fa fa-times"></i>
                Cancelar
              </button>
              <button type="submit" className="btn-salvar">
                <i className="fa fa-save"></i>
                {id ? 'Atualizar' : 'Salvar'}
              </button>
            </div>
          </form>
        </div>
      </div>
      
      <Rodape />
    </div>
  );
};
