package com.itb.tcc.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itb.tcc.entity.Pedido;
import com.itb.tcc.repository.PedidoRepository;

@RestController
@RequestMapping("/encomendas")
@CrossOrigin(value = "*")
public class PedidoController {
    
    @Autowired
    private PedidoRepository repository;
    
    @GetMapping("/listar")
    public List<Pedido> listar() {
        System.out.println("Listando encomendas...");
        List<Pedido> encomendas = repository.findAll();
        System.out.println("Encontradas " + encomendas.size() + " encomendas");
        return encomendas;
    }
    
    @GetMapping("/obter/{id}")
    public Pedido obter(@PathVariable long id) {
        return repository.findById(id).orElse(null);
    }
    
    @GetMapping("/deletar/{id}")
    public String deletar(@PathVariable long id) {
        repository.deleteById(id);
        return "{}";
    }
    
    @GetMapping("/teste")
    public String teste() {
        return "{\"message\": \"Controller funcionando\", \"timestamp\": \"" + java.time.LocalDateTime.now() + "\"}";
    }
    
    @PostMapping("/atualizar")
    public String atualizarEncomenda(@RequestBody Map<String, Object> dados) {
        try {
            Pedido pedido = repository.findById(Long.valueOf(dados.get("id").toString())).orElse(null);
            if (pedido == null) {
                return "{\"success\": false, \"message\": \"Encomenda não encontrada\"}";
            }
            
            if (dados.get("retirada") != null) {
                pedido.setRetirada(Boolean.valueOf(dados.get("retirada").toString()));
            }
            
            if (dados.get("dataRetirada") != null && !dados.get("dataRetirada").toString().isEmpty()) {
                pedido.setDataRetirada(LocalDateTime.parse(dados.get("dataRetirada").toString()));
            }
            
            if (dados.get("quantidade") != null) {
                pedido.setQuantidade(Integer.valueOf(dados.get("quantidade").toString()));
            }
            
            if (dados.get("status") != null) {
                pedido.setStatus(Byte.valueOf(dados.get("status").toString()));
            }
            
            if (dados.get("dataEncomenda") != null) {
                pedido.setDataEncomenda(LocalDateTime.parse(dados.get("dataEncomenda").toString()));
            }
            
            repository.save(pedido);
            return "{\"success\": true, \"message\": \"Encomenda atualizada com sucesso\"}";
        } catch (Exception e) {
            return "{\"success\": false, \"message\": \"Erro ao atualizar encomenda: " + e.getMessage() + "\"}";
        }
    }
    
    @PostMapping("/salvar")
    public String salvarEncomenda(@RequestBody Map<String, Object> dados) {
        try {
            System.out.println("Dados recebidos: " + dados);
            Pedido pedido = new Pedido();
            
            // Definir usuário ID
            pedido.setUsuarioId(Long.valueOf(dados.get("usuarioId").toString()));
            
            // Definir data da encomenda
            if (dados.get("dataEncomenda") != null && !dados.get("dataEncomenda").toString().isEmpty()) {
                String dataStr = dados.get("dataEncomenda").toString();
                if (dataStr.contains("T")) {
                    pedido.setDataEncomenda(LocalDateTime.parse(dataStr));
                } else {
                    pedido.setDataEncomenda(LocalDateTime.now());
                }
            } else {
                pedido.setDataEncomenda(LocalDateTime.now());
            }
            
            // Definir valores da encomenda
            if (dados.get("quantidade") != null) {
                pedido.setQuantidade(Integer.valueOf(dados.get("quantidade").toString()));
            } else {
                pedido.setQuantidade(1);
            }
            
            if (dados.get("preco") != null) {
                pedido.setPreco(Double.valueOf(dados.get("preco").toString()));
            } else {
                pedido.setPreco(Double.valueOf(dados.get("valorTotal").toString()));
            }
            
            pedido.setComentario("Encomenda criada via sistema");
            
            // Definir produto ID (obrigatório)
            if (dados.get("produtoId") != null) {
                pedido.setProdutoId(Long.valueOf(dados.get("produtoId").toString()));
            } else {
                throw new RuntimeException("produtoId é obrigatório");
            }
            
            // Definir status (sempre ativo para novas encomendas)
            pedido.setStatus((byte) 1);
            
            System.out.println("Salvando pedido: " + pedido.getUsuarioId() + ", produto: " + pedido.getProdutoId());
            Pedido pedidoSalvo = repository.save(pedido);
            System.out.println("Pedido salvo com ID: " + pedidoSalvo.getId());
            return "{\"success\": true, \"message\": \"Encomenda salva com sucesso\", \"id\": " + pedidoSalvo.getId() + "}";
            
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"success\": false, \"message\": \"Erro ao salvar encomenda: " + e.getMessage() + "\"}";
        }
    }
}