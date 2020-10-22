
class Endereco {
  String rua;
  String cidade;
  String bairro;
  String estado;
  String cep;
  String numero;

  Endereco(rua, cidade, estado, bairro, cep, numero) {
    this.rua = rua;
    this.cidade = cidade;
    this.bairro = bairro;
    this.estado = estado;
    this.cep = cep.toString();
    this.numero = numero.toString();
  }
}