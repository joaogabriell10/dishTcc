export default (preco) => {
    return `R$ ${preco}${parseInt(preco) == preco ? ".00" : ""}`
}